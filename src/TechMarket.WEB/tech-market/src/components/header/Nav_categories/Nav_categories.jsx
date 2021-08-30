import React from "react";
import { NavDropdown } from 'react-bootstrap';
import { useGetCategories } from '../../../api/get_categories/hooks/get_categories';

const Nav_categories = () => {

    const { data: categories } = useGetCategories();

    return (

        <NavDropdown title="Categories" id="collasible-nav-dropdown">
            {categories.filter(child => child.parentId === categories.find(parent => !parent.parentId).id)
                .map(categ => <NavDropdown.Item href={`/category/${categ.id}`} key={categ.id}>{categ.name}</NavDropdown.Item>)}

            <NavDropdown.Divider />
            <NavDropdown.Item href="/category">All</NavDropdown.Item>
        </NavDropdown>
    );
}

export default Nav_categories;
