<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


		<div class="col-12">
			
			
            <h3 class="text-center">list of products</h3>
			<hr>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">image</th>
						<th scope="col">name</th>
						<th scope="col">description</th>
						<th scope="col">price</th>
						<th scope="col">delete product</th>
					</tr>
				</thead>
				<tbody>
					<tr th:each="product : ${products}">
						<th scope="row"><img alt="" th:src="*{'data:image/jpeg;base64,'+{product.image}}" style="width: 100px;height: 100px;"></th>
						<td>[[*{product.name}]] 
						<!-- Button trigger modal --> <br>
							<button type="button" class="btn btn-success btn-sm mt-2"
								data-toggle="modal"
								th:attr="data-target='#exampleModalCenter'+*{product.id}">change
								name</button> <!-- Modal -->

							<div class="modal fade"
								th:id="*{'exampleModalCenter'+{product.id}}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalCenterTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">change
												product name</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="/changeName" method="post">
												<div class="form-group">
													<label>product id</label> <input type="hidden"
														th:value="*{product.id}" class="form-control" name="id">
													<label>new Product name</label> <input type="text"
														name="newPname" class="form-control"> <br>
													<button type="submit" class="btn btn-primary">submit</button>
												</div>
											</form>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>

										</div>
									</div>
								</div>
							</div>

						</td>
						<td>[[*{product.description}]] <!-- Button trigger modal -->
							<br>
							<button type="button" class="btn btn-success btn-sm mt-2"
								data-toggle="modal"
								th:attr="data-target='#exampleModalCenterDesc'+${product.id}">change
								description</button> <!-- Modal -->
							<div class="modal fade"
								th:id="*{'exampleModalCenterDesc'+{product.id}}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalCenterTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">change
												product description</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">

											<form action="/changeDescription" method="post">
												<div class="form-group">
													<label>product id</label> <input type="text"
														th:value="*{product.id}" class="form-control" name="id">
													<label>new Product description</label> <input type="text"
														name="newDescription" class="form-control"> <br>
													<button type="submit" class="btn btn-primary">submit</button>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>

										</div>
									</div>
								</div>
							</div>
						</td>
						<td>[[*{product.price}]] <!-- Button trigger modal --> <br>
							<button type="button" class="btn btn-success btn-sm mt-2"
								data-toggle="modal"
								th:attr="data-target='#exampleModalCenterPrice'+${product.id}">change
								price</button> <!-- Modal -->
							<div class="modal fade"
								th:id="*{'exampleModalCenterPrice'+{product.id}}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalCenterTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalCenterTitle">change
												product price</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">

											<form action="/changePrice" method="post">
												<div class="form-group">
													<label>product id</label> <input type="text"
														th:value="*{product.id}" class="form-control" name="id">
													<label>new Product price</label> <input type="text"
														name="newPrice" class="form-control"> <br>
													<button type="submit" class="btn btn-primary">submit</button>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save
												changes</button>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td><a th:href="@{/deleteProd/{id}(id=${product.id})}"
							class="btn btn-danger mt-4">delete</a></td>
					</tr>
				</tbody>
			</table>
			<hr>
		</div>
    