import { Link } from 'react-router-dom';
import { Navbar, Nav } from 'react-bootstrap';

export const Header = () => {
    return (
        <Navbar bg="dark" variant="dark">
            <Nav className="mr-auto">
                <Nav.Link href="/random">一日分の献立</Nav.Link>
                <Nav.Link href="/list">レシピ一覧</Nav.Link>
            </Nav>
        </Navbar>
    )
}
