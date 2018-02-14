<?php

namespace App\Policies;

use App\Model\admin\admin;

use Illuminate\Auth\Access\HandlesAuthorization;

class PostPolicy
{
    use HandlesAuthorization;


    public function view(admin $user, post $post)
    {
        //
    }

    /**
     * Determine whether the user can create posts.
     *
     * @param  \App\Model\user\User  $user
     * @return mixed
     */
    public function create(admin $user)
    {
        return $this->getPermission($user, 6);
    }



    public function update(admin $user)
    {
        return $this->getPermission($user, 4);
    }


    public function delete(admin $user)
    {
        return $this->getPermission($user, 7);
    }

    public function tag(admin $user)
    {
        return $this->getPermission($user, 12);
    }

    public function category(admin $user)
    {
        return $this->getPermission($user, 13);
    }


    protected function getPermission($user, $p_id) {
        foreach ($user->roles as $role) {
            foreach ($role->permissions as $permission) {
                if ($permission->id == $p_id) {
                    return true;
                }
            }
        }
        return false;
    }
}
