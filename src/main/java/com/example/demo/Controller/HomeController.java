package com.example.demo.Controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;

import org.springframework.context.event.EventListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Backend.Backend123;
import com.example.demo.Backend.EmailService;

import com.example.demo.Model.User;

import com.example.demo.Model.cart;
import com.example.demo.Model.category;
import com.example.demo.Model.customer;
import com.example.demo.Model.ordersdp;
import com.example.demo.Model.product;
import com.example.demo.Model.returned;
import com.example.demo.Model.seller;
import com.example.demo.Model.rating;
import com.example.demo.Repository.Cart;
import com.example.demo.Repository.Category;
import com.example.demo.Repository.Customer;
import com.example.demo.Repository.Order;
import com.example.demo.Repository.Product;
import com.example.demo.Repository.Rating;
import com.example.demo.Repository.Returned;
import com.example.demo.Repository.SdpRepo;
import com.example.demo.Repository.Seller;


@Controller
public class HomeController 
{
	public HomeController()
	{
		super();
	}

	@Autowired
	Backend123 ss;
	@Autowired
	SdpRepo repo;
	@Autowired
	Product prepo;
	@Autowired
	Cart cart123;
	
	@Autowired
	Customer cst;
	@Autowired
	Category cat;
	@Autowired
	Order or;
	
	@Autowired
	Seller sell;
	@Autowired
	Rating rate;
	@Autowired
	Returned retu;
	@Autowired
	private EmailService mail;
	
	int c=0;
	int flag=0;
	String otp="";
	String otpmail="";
	String uuname="";
	String unamesell="";
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	@RequestMapping("/")
	public String home(Model map)
	{
		c=0;
		List<product> products = ss.getAllActiveProducts();
		map.addAttribute("products", products);
		return "index";
	}
	/*@RequestMapping("/register")
	public String home2()
	{
		return "register";
	}*/
	
	@PostMapping("/saveuser")
	public ModelAndView addUser( User user,@RequestParam("email") String uname)
	{
		ModelAndView mv=new ModelAndView();
		User u=repo.findByEmail(uname);
		if(u==null)
		{
			mail.sendSimpleEmail(uname,
				"Thank you for Registering into sdp3handicrafts","Greetings");
			PasswordEncoder encoder = new BCryptPasswordEncoder();
			String pass=user.getPassword();
			String hashedPassword = encoder.encode(pass);
			user.setPassword(hashedPassword);
			ss.saveData(user);
			mv.setViewName("sucess");
			return mv;
		}
		else
		{
			ModelAndView mv1=new ModelAndView();
			mv1.setViewName("fail");
			return mv1;
		}
	}
	/*@RequestMapping("/login")
	public String login()
	{
		return "login";
	}*/
	@RequestMapping("/home")
	public String home12()
	{
		c=0;
		return "home";
	}
	@PostMapping("/auth")
	public String auth1(@RequestParam("username") String username,@RequestParam("password") String password,HttpServletRequest request ,Model map)
	{
		//c=0;
		flag=0;
		HttpSession session=request.getSession();
		User auser=repo.findByUsername(username);
		if(auser!=null)
		{
			int id=auser.getId();
			uuname=auser.getUsername();
			String uname=auser.getUsername();
			String upass=auser.getPassword();
			boolean k=BCrypt.checkpw(password, upass);
	
			if(username.equalsIgnoreCase(uname) && k) 
			{
				if(c==0)
				{
					session.setAttribute("uname", uuname);
				}
				else
				{
					session.setAttribute("uname", null);
				}
				
				List<product> products = ss.getAllActiveProducts();
				List<category> ca=cat.findAll();
				for(product pp:products)
				{
					System.out.println(pp.getPname());
				}
			
				
				map.addAttribute("id",id);
				map.addAttribute("products", products);
				map.addAttribute("cate", ca);
				return "success2";
			}
		}
		else
		{
			
			return "fail";
		}
		return "fail";
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	  public ModelAndView logout(HttpServletRequest request) 
			{
				c=1;
				HttpSession s=request.getSession(); 	
			    s.setAttribute("uname",null);
			    System.out.print(s.getAttribute("uname"));
				s.invalidate();
				ModelAndView mv = new ModelAndView();
				mv.setViewName("home");
				return mv;
			}
			@RequestMapping("/404")
			public String pagenotfound()
			{
				return "404";
			}
	@RequestMapping("/admin")
	public String admin()
	{
		return "loginAdmin";
	}
	@RequestMapping("/authAdmin")
	public String authA(@RequestParam("username") String username,@RequestParam("password") String password)
	{
		if(username.equals("sdpps02")&&password.equals("123"))
		{
			return "Adminlogin";
		}
		else
		{
			return "redirect:/admin";
		}
	}
	@RequestMapping("/pro")
	public String pro(Model map,HttpServletRequest request, HttpServletResponse response)
	{
		
		List<product> products = ss.getAllActiveProducts();
		map.addAttribute("products", products);
		List<category> cat=ss.getAllActiveCategory();
		map.addAttribute("category", cat);
		return "product";
	}
	
	@RequestMapping("/acc")
	public String acc(Model map)
	{
		int k=1;
		map.addAttribute("k",k);
		return "accounts";
	}
	@RequestMapping("/customer")
	public String custom(Model map)
	{
		List<User> user=ss.getAllActiveUser();
		map.addAttribute("user", user);
		int k=0;
		map.addAttribute("k",k);
		return "accounts";
	}
	@RequestMapping("/addproduct")
	public String addp(Model map)
	{
		List<category> cat=ss.getAllActiveCategory();
		map.addAttribute("category", cat);
		return "addproduct";
	}
	@RequestMapping("/editproduct")
	public String edp()
	{
		return "editproduct";
	}
	@GetMapping("/dash")
	public String barGraph(Model model) {
		Map<String, Integer> surveyMap = new LinkedHashMap<>();
		surveyMap.put("Java", 40);
		surveyMap.put("Dev oops", 25);
		surveyMap.put("Python", 20);
		surveyMap.put(".Net", 15);
		model.addAttribute("surveyMap", surveyMap);
		return "dashboard";
	}
	   @PostMapping("/addp")
	   public 
	   @ResponseBody ModelAndView 
	   createEmployee(@RequestParam("file") String file,
	    		@RequestParam("pname") String name,
	    		@RequestParam("category") String category,
	    		@RequestParam("desc") String desc,
	    		@RequestParam("stock") float stock, @RequestParam("discount") float discount,@RequestParam("sellername") String sellername,Model map, HttpServletRequest request)
	   {
		try {
			product product = new product();
			product.setPname(name);
			product.setImage(file);
			product.setUnitinstock(stock);
			product.setDecs(desc);
		
			product.setCategory(category);
			product.setDiscount(discount);
			product.setRating(1);
			product.setSname(sellername);
			ss.saveProduct(product);
			List<product> products = ss.getAllActiveProducts();
			map.addAttribute("products", products);
			List<category> cat=ss.getAllActiveCategory();
			map.addAttribute("category", cat);
			ModelAndView mv=new ModelAndView();
			mv.setViewName("product");
			return mv;
		
		} catch (Exception e) 
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("product");
			return mv;
		
		}
	}
	   
	   //deleting the products from admin page
		@GetMapping("/delete/{id}")
		public String  deleteStudent(@PathVariable("id") int id,Model map,HttpServletRequest request, HttpServletResponse response)
		{
			product p=prepo.findById(id);
			String name=p.getPname();
			String s=p.getImage();
			ss.deleteBy(id);
			map.addAttribute("name",name);
			map.addAttribute("pro",s);
			return "removepro";
		}
		
		//Sending an email
		@RequestMapping("/forgot")
		public String forgot123()
		{
			return "forgot";
		}
		@RequestMapping("/sendemail")
		public String  sendmail(@RequestParam("username") String username,HttpServletRequest request,Model map)
		{
			User auser=repo.findByUsername(username);
			if(auser!=null)
			{
				map.addAttribute("id",auser.getId());
				map.addAttribute("uname",username);
				otp=mail.generateOTP(4);
				System.out.println(auser.getEmail());
				mail.sendSimpleEmail(auser.getEmail(),
						otp,
						"Hello Customer here is your OTP 😊😊😊");
				return "otpcheck";
			}
		  return "fail";
			
			
		}	
		@RequestMapping("/otpcheck/{id}")
		public String otpcheck(@PathVariable("id") int id,@RequestParam("otp") String otp1,Model map)
		{
			System.out.println(otp+" "+otp1);
			if(otp.equals(otp1))
			{
				int y=(int)id;
				System.out.println(y);
				map.addAttribute("id",y);
				return "forgotprocess";
			}
			return "fail";
		}
		@PostMapping("/forgot/{id}")
		public ModelAndView forgot(@PathVariable("id") int id,@RequestParam("password") String password,Model map)
		{
			int y=(int)id;
			System.out.println(y);
			User u=repo.findById(y);
			System.out.println(u.getEmail());
			PasswordEncoder encoder = new BCryptPasswordEncoder();
			System.out.println(password);
			String pass=(String)password;
			String hashedPassword = encoder.encode(password);
			u.setPassword(hashedPassword);
			ss.saveData(u);
			ModelAndView mv=new ModelAndView();
			mv.setViewName("successreset");
			return mv;
		}
		
		//cart
		
		@RequestMapping("/addingcart/{id}") //here id is product id
		public String addcart(@PathVariable("id") int id,HttpServletResponse reponse,Model map)
		{
			//System.out.println(id);
			product pro=prepo.findById(id);
			cart obj=new cart();
			//cart u=null;
			// u=cart123.findByPname(pro.getPname());
			User user=repo.findByUsername(uuname);
			 List<cart> us=cart123.findByCuname(uuname);
			if(us==null)
			{
				obj.setPid(pro.getPid());
				obj.setCuname(uuname);
				obj.setCategory(pro.getCategory());
				obj.setImage(pro.getImage());
				float y1=pro.getDiscount();
				float y=pro.getUnitinstock();
				float y2=y*y1;
				obj.setPrice(y2);
				obj.setPname(pro.getPname());
				obj.setCount(1);
				obj.setCuid(user.getId());
				obj.setSname(pro.getSname());
				System.out.println(pro.getSname()+"cart123132");
				cart123.save(obj);
			}
			else
			{
				int y123=0;
			
				//u.setCount(y);
				int flag=0;
				for(cart ci:us)
				{
					String s1=ci.getPname();
					String s2=pro.getPname();
					System.out.println(s1+" "+s2+" "+"product");
					int u1=s1.compareTo(s2);
					if(u1==0)
					{
						System.out.println(s1+" "+s2+" "+"product123");
						System.out.println("Hellocasdad");
						y123=ci.getCount();
						y123++;
						ci.setCount(y123);
						cart123.save(ci);
						flag=1;
						break;
					}
				}
				if(flag==0)
				{
					obj.setPid(pro.getPid());
					obj.setCuname(uuname);
					obj.setCategory(pro.getCategory());
					obj.setImage(pro.getImage());
					float y1=pro.getDiscount();
					float y=pro.getUnitinstock();
					float y2=y*y1;
					obj.setPrice(y2);
					obj.setPname(pro.getPname());
					obj.setCount(1);
					obj.setCuid(user.getId());
					obj.setSname(pro.getSname());
					cart123.save(obj);
					
				}
				
				//cart123.save(u);
			}
			List<product> products = ss.getAllActiveProducts();
			map.addAttribute("products", products);
			
			return "success2";
		}
		@RequestMapping("/addingcart1/{id}") //here id is product id
		public String addcart1(@PathVariable("id") int id,HttpServletResponse reponse,Model map)
		{
			product pro=prepo.findById(id);
			cart obj=new cart();
			cart u=null;
			 u=cart123.findByPname(pro.getPname());
			if(u==null)
			{
				obj.setPid(pro.getPid());
				obj.setCuname(uuname);
				obj.setCategory(pro.getCategory());
				obj.setImage(pro.getImage());
				float y1=pro.getDiscount();
				float y=pro.getUnitinstock();
				float y2=y*y1;
				obj.setPrice(y2);
				obj.setPname(pro.getPname());
				obj.setCount(1);
				cart123.save(obj);
			}
			else
			{
				int y=u.getCount();
				y++;
				u.setCount(y);
				cart123.save(u);
			}
			int sum=0;
		    List<cart> cartItems =cart123.findByCuname(uuname);
		    for(cart l:cartItems)
		    {
		    	sum+=(l.getPrice()*l.getCount());
		    }
		    map.addAttribute("carts", cartItems);
		    map.addAttribute("total",sum);
			List<product> products = ss.getAllActiveProducts();
			map.addAttribute("products", products);
			
			return "redirect:/myCart";
		}
		@RequestMapping("/producthome")
		public String homecall(Model map)
		{
			flag=0;
			List<product> products = ss.getAllActiveProducts();
			map.addAttribute("products", products);
			List<category> cc=cat.findAll();
			map.addAttribute("cate",cc);
			
			return "success2";
		}
		
		@GetMapping("/myCart")
		public String myCart(Model map){
				int sum=0;
				int flag1=0;
		    List<cart> cartItems =cart123.findByCuname(uuname);
		    for(cart l:cartItems)
		    {
		    	sum+=(l.getPrice()*l.getCount());
		    }
		    map.addAttribute("carts", cartItems);
		    map.addAttribute("total",sum);
		    
		    if(sum>0)
		    {
		    	flag1=1;
		    }
		    map.addAttribute("flag1",flag1);
		    System.out.println(flag1);
		    return "cart";
		}
		@RequestMapping("/profile/{id}")
		public String profile(@PathVariable("id") int id,Model map)
		{
			User u=repo.findById(id);
			map.addAttribute("user",u);
			return "profile";
		}
		
		@RequestMapping("/addcat")
		public String cate()
		{
			return "category";
		}
		@PostMapping("/addc")
		public String addcate(@RequestParam("cname") String cname,Model map)
		{
			category c=new category();
			c.setCname(cname);
			ss.saveCat(c);
			List<product> products = ss.getAllActiveProducts();
			map.addAttribute("products", products);
			List<category> cat=ss.getAllActiveCategory();
			map.addAttribute("category", cat);
			return "product";
			
		}
		@RequestMapping("/deletecat/{id}")
		public String removecat(@PathVariable("id") int id,Model map)
		{
			ss.deleteByCat(id);
			List<product> products = ss.getAllActiveProducts();
			map.addAttribute("products", products);
			List<category> cat=ss.getAllActiveCategory();
			map.addAttribute("category", cat);
			return "product";
		}
		@RequestMapping("/detailproduct/{id}")
		public String deatailimage(@PathVariable("id") int id,Model map)
		{
			product pro=ss.findByproId(id);
			String cat=pro.getCategory();
			List<product> products = ss.getAllActiveProducts();;
			List<product> pro123=new ArrayList<product>();
			for(product p:products)
			{
				
				String b=p.getCategory();
				//System.out.println(b+" "+cat+" "+p.getPname());
				if(b.equals(cat))
				{
					
					pro123.add(p);
				}
			}
			//List<product> seller=prepo.findBySname(pro)
			map.addAttribute("cat123",pro123);
			map.addAttribute("pro",pro);
			return "productdetail";
		}
		@RequestMapping("/sellerproducts/{sname}")
		public String sellerproduct(@PathVariable("sname") String sname,Model map)
		{
			List<product> list=prepo.findBySname(sname);
			List<category> catlist=new ArrayList<category>();
			//List<category> cat123=cat.findAll();
			seller sobj=sell.findByUsername(sname);
			Set<category> hset=new HashSet<category>();
			for(product k:list)
			{
				category obj=cat.findByCname(k.getCategory());
				hset.add(obj);
			}
			for(category x:hset)
			{
				catlist.add(x);
			}
			map.addAttribute("sname", list);
			map.addAttribute("cate", catlist);
			map.addAttribute("sellername", sname);
			map.addAttribute("selleremail", sobj.getEmail());
			return "viewsellerpros";
		}
		@RequestMapping("/deletecart/{id}")
		public String removecart(@PathVariable("id") int id,Model map,HttpServletResponse rep)
		{
			
			cart cc=cart123.findByCid(id);
				int y=cc.getCount();
				y--;
				if(y==0)
				{
					cart123.deleteById(id);
				}
				else
				{
					cc.setCount(y);
					cart123.save(cc);
				}
				int sum=0;
			   List<cart> cartItems =cart123.findByCuname(uuname);
			    for(cart l:cartItems)
			    {
			    	sum+=(l.getPrice()*l.getCount());
			    }
			    map.addAttribute("carts", cartItems);
			    map.addAttribute("total",sum);
			    
			return "redirect:/myCart";
		}
		
		//search result
		@RequestMapping("/search")
		public String search(@RequestParam("search") String search,Model map)
		{
			List<product> products = ss.getAllActiveProducts();
			List<product> pro=new ArrayList<product>();
			for(product p:products)
			{
				String name=p.getPname();
				String s2=name.substring(0, 2);
				String s3=s2.toLowerCase();
				String s4=search.toLowerCase();
				if(s4.contains(s3))
				{
					pro.add(p);
				}
			}
			map.addAttribute("promatch",pro);
			return "search";
		}
		//search recommendations
		@GetMapping("/asearch")
		@ResponseBody
		public ArrayList<String>doAutoComplete(@RequestParam("q") final String l)
		{ ArrayList<String> list = new ArrayList<String>();
			if(l!=null)
			{
		       
		        product p=new product();
		        char m=l.charAt(0);
		        String q="";
		        q+=m;
		        List<product> p1=prepo.findByPnameStartsWith(q);
		      //  PreparedStatement ps = null;
		        String data;
		        for(product k:p1)
		        {
		        	System.out.println(k.getPname());
		        	list.add(k.getPname());
		        }
		      
			}
			  return list;
	        
	    }
		//sort by price
		@RequestMapping("/sortprice")
		public String sortprice(Model map)
		{
			flag=1;
			Comparator<product> compareByName = new Comparator<product>() {
				@Override
				public int compare(product o1, product o2) {
					return o1.getPname().compareTo(o2.getPname());
				}
			};
			List<product> pro=ss.getAllActiveProducts();
			Collections.sort(pro, compareByName);
			map.addAttribute("products", pro);
			map.addAttribute("flag",flag);
			return "success2";
		}
		public boolean isFilled(String name,List<String> l)
		{
			
			for(String i:l)
			{
				int y=name.compareTo(i);
				if(y==0)
				{
					return false;
				}
			}
			return true;
		}
	@RequestMapping("/reports")
	public String trail(Model map)
	{
		int totalsales=0;
		List<ordersdp> ol=or.findAll();
		float totalprofit=0;
		
		for(ordersdp p:ol)
		{
		
			product pro=prepo.findByPname(p.getPname());
			System.out.println("Enter first level"+p.getPname());
				int c=p.getCount();
				float pri=pro.getUnitinstock();
				float dis=pro.getDiscount();
				totalprofit+=(c*pri)*dis;
				int v=(int)pri;
				totalsales+=c*v;
			
		}
		//System.out.println("Second level");
		for(ordersdp k:ol)
		{
			
			String name=k.getCuname();		
			customer c=cst.findByCuname(name);
			customer cu=new customer();
			if(c==null)
			{
				cu.setCuname(name);
				cu.setStatus(k.getStatus());
				product pro=prepo.findByPname(k.getPname());
				cu.setTotal(pro.getUnitinstock());
				cst.save(cu);
			}
			else
			{
				
				product pro=prepo.findByPname(k.getPname());
				float v=pro.getUnitinstock();
				float v1=c.getTotal();
				c.setTotal(v+v1);
				cst.save(c);
				
			}
			
		}
		List<product> pp=prepo.findAll();
		List<product> pp1=new ArrayList<product>();
		int c=0;
		for(product m:pp)
		{
			c++;
			pp1.add(m);
			if(c==5)
			{
				break;
			}
		}
		long count=or.count();
		List<customer> cust=cst.findAll();
		map.addAttribute("totalorders",count);
		map.addAttribute("sales", totalsales);
		map.addAttribute("profit",totalprofit);
		map.addAttribute("cust",cust);
		map.addAttribute("top",pp1);
		return "report";
	}
	@RequestMapping("/dashboard2")
	public String dahboa()
	{
		return "dashboard";
	}
	@RequestMapping("/header")
	public String header(Model map)
	{
		List<product> pro=ss.getAllActiveProducts();

		map.addAttribute("products", pro);
		return "ne";
	}
	@RequestMapping("/chart1")
	public String chart1()
	{
		return "chart1";
	}
	@RequestMapping("/chart2")
	public String chart2(HttpServletRequest req,HttpServletResponse res)
	{
		long v=prepo.count();
		HttpSession session = req.getSession();
		String s132="";
		s132+=v;
		session.setAttribute("count",s132);
		return "chart2";
	}
	public void sendEmail() 
	{
		System.out.println("mail"+uuname);
		Map<String, Object> model123 = new HashMap<>();
		User u=repo.findByUsername(uuname);
		List<cart> ol=cart123.findByCuid(u.getId());
		String email=u.getEmail();
		String to=email;
		String subject="These are ordered products";
		model123.put("ol",ol);
		mail.sendEmail(to,subject, model123);

	}
	@RequestMapping("/chart3")
	public String chart3()
	{
		return "chart3";
	}
	//checkout
	@RequestMapping("/checkout")
	public String check(Model map)
	{
		int sum=0;
	    List<cart> cartItems =cart123.findByCuname(uuname);
	    for(cart l:cartItems)
	    {
	    	sum+=(l.getPrice()*l.getCount());
	    }
	    map.addAttribute("carts", cartItems);
	    map.addAttribute("total",sum);
		return "checkout";
	}
	
	@RequestMapping("/payment")
	public String pay(Model map)
	{
		int sum=0;
	    List<cart> cartItems =cart123.findByCuname(uuname);
	    for(cart l:cartItems)
	    {
	    	
	    	sum+=(l.getPrice()*l.getCount());
	    }
	    double tax=sum/0.2;
	    double n=sum*1.0;
	    double total=tax+n;
	    map.addAttribute("pay",total);
	    
	   

	    User u=repo.findByUsername(uuname);
	
	    System.out.println(u.getId());
		
	    for(cart c:cartItems)
	    {
	    	
	    	List<ordersdp> list=or.findByCuid(u.getId());
	        ordersdp o1=new ordersdp();
	        	if(list==null)
	        	{
	        		o1.setPid(c.getPid());
	        		o1.setCategory(c.getCategory());
	        		o1.setCount(c.getCount());
	        		o1.setImage(c.getImage());
	        		o1.setCuname(c.getCuname());
	        		o1.setPname(c.getPname());
	        		o1.setCuid(u.getId());
	        		o1.setStatus("On Process");
	        		o1.setCartid(c.getCid());
	        		//seller v=sell.findByUsername(c.getSname());
	        		o1.setSname(c.getSname());
	        		System.out.println(c.getCid());
	        		or.save(o1);
	        	}
	        	else
	        	{
	        		int flag=0;
	        		for(ordersdp ol:list)
	        		{
	        			String s1=ol.getPname();
	        			String s2=c.getPname();
	        			int u123=s1.compareTo(s2);
	        			if(u123==0)
	        			{
	        				int y123=ol.getCount();
	        				y123+=c.getCount();
	        				ol.setCount(y123);
	        				or.save(ol);
	        				flag=1;
	        				break;
	        			}
	        		}
	        		if(flag==0)
	        		{
	        			o1.setPid(c.getPid());
		        		o1.setCategory(c.getCategory());
		        		o1.setCount(c.getCount());
		        		o1.setImage(c.getImage());
		        		o1.setCuname(c.getCuname());
		        		o1.setPname(c.getPname());
		        		o1.setCuid(u.getId());
		        		o1.setStatus("On Process");
		        		o1.setCartid(c.getCid());
		        		o1.setSname(c.getSname());
		        		System.out.println(c.getCid());
		        		or.save(o1);
	        		}
	        	}
	    	
	    	
	    	
	    }
	   sendEmail();
	    User obj=repo.findByUsername(uuname);
	    int k=(int)obj.getId();
	    cart123.deleteByCuid(k);
		return "paysuccess";
	}
	@RequestMapping("/orders")
	public String order(Model mp)
	{
		User u=repo.findByUsername(uuname);
		List<ordersdp> orobj=or.findByCuid(u.getId());
		mp.addAttribute("order1", orobj);
		return "order";
	}
	
	@RequestMapping("/getorders")
	public String getAdmin(Model map)
	{
		List<ordersdp> ol=or.findAll();
		map.addAttribute("orders", ol);
		return "adminorder";
	}
	@RequestMapping("/changetosucc/{id}")
	public String changesucc(@PathVariable("id") int id)
	{
		System.out.println(id);
		ordersdp ol=or.findByOid(id);
	
		ol.setStatus("Delivered");
		List<ordersdp> ol1=or.findAll();
		
		for(ordersdp k:ol1)
		{
			returned r=new returned();
			String s=k.getStatus();
			if(s=="Delivered")
			{
				r.setCuid(k.getCuid());
				seller v=sell.findByUsername(k.getSname());
				r.setSid(v.getSid());
				r.setOid(k.getOid());
				r.setPid(k.getPid());
				r.setImage(k.getImage());
				r.setPname(k.getPname());
				r.setSname(k.getSname());
				r.setCuname(k.getCuname());
				r.setStatus(k.getStatus());
				r.setRating(0);
				retu.save(r);
			}
		}
		
		or.save(ol);
		return "redirect:/getorders";
	}
	@RequestMapping("/changetoreject/{id}")
	public String changereject(@PathVariable("id") int id)
	{
		System.out.println(id);
		ordersdp ol=or.findByOid(id);
	
		ol.setStatus("rejected");
		or.save(ol);
		return "redirect:/getorders";
	}
	
	@RequestMapping("cancel/{id}")
	public String cancel(@PathVariable("id") int id)
	{
		ordersdp ol=or.findByOid(id);
		
		ol.setStatus("Cancelled");
		or.save(ol);
		return "redirect:/orders";
	}
	@RequestMapping("/sortcatseller/{id}/{sellername}")
	public String sortcatseller(@PathVariable("id") int cid,@PathVariable("sellername") String sname,Model map)
	{
		category c=cat.findByCid(cid);
		List<product> list=prepo.findBySname(sname);
		List<category> catlist=new ArrayList<category>();
		List<product> list2=new ArrayList<product>();
		Set<category> hset=new HashSet<category>();
		//List<category> cat123=cat.findAll();
		for(product k:list)
		{
			category obj=cat.findByCname(k.getCategory());
			String s1=k.getCategory();
			String s2=c.getCname();
			int u=s1.compareToIgnoreCase(s2);
			if(u==0)
			{
				list2.add(k);
			}
			hset.add(obj);
		}
		for(category x:hset)
		{
			catlist.add(x);
		}
		map.addAttribute("sname", list2);
		map.addAttribute("cate", catlist);
		map.addAttribute("sellername", sname);
		return "viewsellerpros";
	}
	//sort by category
	@RequestMapping("/sortcat/{id}")
	public String sortcat(@PathVariable("id") int id,Model map)
	{
		category c=cat.findByCid(id);
		System.out.println(c.getCname()+"Category");
		List<product> pro=prepo.findByCategory(c.getCname());
		for(product p:pro)
		{
			System.out.println(p.getCategory());
		}
		map.addAttribute("products", pro);
		List<category> cc=cat.findAll();
		map.addAttribute("cate",cc);
		return "success2";
	}
	@RequestMapping("/sellerlogin")
	public String sellerlogin()
	{
		return "sellerlogin";
	}
	@PostMapping("/saveseller")
	public String saveseller(seller obj)
	{
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		String pass=obj.getPassword();
		String hashedPassword = encoder.encode(pass);
		obj.setPassword(hashedPassword);
		sell.save(obj);
		return "sellerlogin";
	}
	@PostMapping("/authseller")
	public String authseller(@RequestParam("username") String username,@RequestParam("password") String password,HttpServletRequest request ,Model map)
	{
		seller selluser=sell.findByUsername(username);
		if(selluser!=null)
		{
			
			 unamesell=selluser.getUsername();
			String upass=selluser.getPassword();
			HttpSession session=request.getSession();
			session.setAttribute("uname123", unamesell);
			boolean k=BCrypt.checkpw(password, upass);
			if(username.equalsIgnoreCase(unamesell) && k) 
			{
				map.addAttribute("uname123", unamesell);
				return "sellerland";
			}
			else
			{
				return "sellerlogin";
			}
		}
		return "sellerlogin";
	}

	@RequestMapping("/sellerhome")
	public String sellerhome()
	{
		return "sellerland";
	}
	@RequestMapping("/selleradd")
	public String selleradd(Model map)
	{
		System.out.println(unamesell);
		map.addAttribute("uname123",unamesell);
		List<category> cat=ss.getAllActiveCategory();
		map.addAttribute("category", cat);
		return "sellerproadd";
	}
	@PostMapping("/sellerproduct")
	public String sellerproduct(@RequestParam("file") String file,
    		@RequestParam("pname") String name,
    		@RequestParam("category") String category,
    		@RequestParam("desc") String desc,
    		@RequestParam("stock") float stock, @RequestParam("discount") float discount,Model map, HttpServletRequest request)
	{
		System.out.println(unamesell);
		product product = new product();
		product.setPname(name);
		product.setImage(file);
		product.setUnitinstock(stock);
		product.setDecs(desc);
		product.setSname(unamesell);
		product.setCategory(category);
		product.setDiscount(discount);
		ss.saveProduct(product);
		List<product> products = ss.getAllActiveProducts();
		map.addAttribute("products", products);
		List<category> cat=ss.getAllActiveCategory();
		map.addAttribute("category", cat);
		return "sellerland";
	}
	//View the added products
	@RequestMapping("/sellerview")
	public String sellerview(Model map)
	{
		
		List<product> list=prepo.findBySname(unamesell);
		map.addAttribute("sell", list);
		return "listofsell";
	}
	@RequestMapping("/sellerchart")
	public String sellerchart1(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.setAttribute("uname123", unamesell);
		return "sellerchart1";
	}
	@RequestMapping("/deliveredpro")
	public String devlive(Model map)
	{

		List<returned> re=retu.findByCuname(uuname);
		map.addAttribute("retu123", re);
		for(returned k:re)
		{
			System.out.println(k.getCuname());
		}
		return "returned";
	}
	@RequestMapping("/rating/{id}")
	public String rating(@PathVariable("id") int id,Model map)
	{
		map.addAttribute("pid", id);
		return "rating";
	}
	@PostMapping("/rated/{id}")
	public String rated(@PathVariable("id") int id,@RequestParam("rating") String rating12)
	{
		rating r1=rate.findByPid(id);
		int rating123=Integer.parseInt(rating12); 
		System.out.println(rating123);
		rating r2=new rating();
		User u=repo.findByUsername(uuname);
		returned re=retu.findByPidAndCuid(id,u.getId());
		//product pro=prepo.findById(id);
		product pro=prepo.findById(id);
		if(r1==null)
		{
			r2.setPid(id);
		
			r2.setPname(pro.getPname());
			r2.setRating(rating123);
			r2.setCount(1);
			pro.setRating(rating123);
			prepo.save(pro);
			re.setRating(rating123);
			rate.save(r2);
		}
		else
		{
			int count=r1.getCount();
			int rating00=r1.getRating();
			rating00+=rating123;
			count++;
			int u123=rating00/count;
			r1.setRating(u123);
			r1.setCount(count);
			re.setRating(u123);
			pro.setRating(u123);
			prepo.save(pro);
			rate.save(r1);
		}
		
		return "redirect:/deliveredpro";
	}


	
 
}
