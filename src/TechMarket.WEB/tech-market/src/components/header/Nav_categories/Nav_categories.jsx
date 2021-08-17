import React from "react";
import { NavDropdown } from 'react-bootstrap';
import { useGetCategories } from '../../../api/get_categories/hooks/get_categories';

const Nav_categories = () => {

    const { data: categories } = useGetCategories();

    return (
        <NavDropdown title="Categories" id="collasible-nav-dropdown">

            {categories.length === 0
                ? ' '
                : categories.filter(parent => parent.parentId === 1)
                    .map((categ) => <NavDropdown.Item href={categ.name} key={categ.id}>{categ.name}</NavDropdown.Item>)}
            <NavDropdown.Divider />

            <NavDropdown.Item href="#">All</NavDropdown.Item>
        </NavDropdown>
    );
}

export default Nav_categories;
