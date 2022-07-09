import { Link } from 'react-router-dom';

export const Header = () => {
    return (
        <header>
            <Link to={`/random`}>一日分の献立</Link>
            <Link to={`/list`}>レシピ一覧</Link>
        </header>
    )
}