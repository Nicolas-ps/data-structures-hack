namespace App;

class Dictionary<Tk as arraykey, Tv> {
    public dict<Tk, Tv> $items;

    public function __construct(): void {
        $this->items = dict[];
    }

    public function add(Tk $key, Tv $value): void {
        $this->items[$key] = $value;
    }

    public function remove(Tk $key): void {
        unset($this->items[$key]);
    }

    public function find(Tk $key): Tv {
        return $this->items[$key];
    }

    public function values (): vec<Tv> {
        return vec($this->items);
    }

    public function print(): string {
        $result = '{';
        $first = true;
        foreach ($this->items as $key => $value) {
            if (!$first) {
                $result .= ', ';
            }
            $result .= $key . ': ' . (string)$value;
            $first = false;
        }
        $result .= '}';
        return $result;
    }
}