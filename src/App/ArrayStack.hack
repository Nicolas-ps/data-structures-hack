namespace App;

use HH\Lib\Str;

class ArrayStack {
    private vec<mixed> $elements;
    private int $topOfStack = -1;
    private int $capacity;

    public function __construct(int $capacity) {
        $this->elements = vec[];
        $this->capacity = $capacity;
    }

    public function push(mixed $element): bool
    {
        if ($this->topOfStack == $this->capacity - 1) {
            return false;
        }

        $this->topOfStack++;
        $this->elements[] = $element;

        return true;
    }

    public function pop(): mixed {
        if ($this->topOfStack == -1) {
            return false;
        }

        $element = $this->elements[$this->topOfStack];
        $this->elements[$this->topOfStack] = null;
        --$this->topOfStack;
        return $element;
    }

    public function print(): string {
        if ($this->topOfStack == -1) {
            return "Stack is empty";
        }
        
        $result = "Stack: [";
        for ($i = 0; $i <= $this->topOfStack; $i++) {
            $result .= (string) $this->elements[$i];
            if ($i < $this->topOfStack) {
                $result .= ", ";
            }
        }
        $result .= "]";
        
        return $result;
    }
}