From: corbet@lwn.net (Jonathan Corbet)
Date: Sat, 22 Jun 2019 09:00:46 -0600
Subject: [Linux-kernel-mentees] [PATCH 2/3] Documentation: RCU: Convert
 RCU linked list to ReST
In-Reply-To: <20190622070251.GA7182@rYz3n>
References: <20190622070251.GA7182@rYz3n>
Message-ID: <20190622090046.178d9d16@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190622150046.USI35IP1vToSvMniQYPd3QSTjxyWhP4FFNNkebHFqj4@z>

On Sat, 22 Jun 2019 02:02:51 -0500
Jiunn Chang <c0d1n61at3 at gmail.com> wrote:

> Convert RCU linked list and add TOC tree hook.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  Documentation/RCU/index.rst    |   1 +
>  Documentation/RCU/listRCU.txt  | 315 -------------------------------
>  Documentation/RCU/list_rcu.rst | 335 +++++++++++++++++++++++++++++++++
>  Documentation/RCU/rcu.rst      |   4 +-
>  4 files changed, 338 insertions(+), 317 deletions(-)
>  delete mode 100644 Documentation/RCU/listRCU.txt
>  create mode 100644 Documentation/RCU/list_rcu.rst

Sometimes it can be better to do a change like this in two steps, with the
second being just renaming the file.  That can make it easier to see what
has actually changed.

[...]

> diff --git a/Documentation/RCU/list_rcu.rst b/Documentation/RCU/list_rcu.rst
> new file mode 100644
> index 000000000000..255c9e173fba
> --- /dev/null
> +++ b/Documentation/RCU/list_rcu.rst
> @@ -0,0 +1,335 @@
> +.. _list_rcu_doc:
> +
> +Using RCU to Protect Read-Mostly Linked Lists
> +=============================================
> +
> +One of the best applications of RCU is to protect read-mostly linked lists
> +(*struct list_head* in ``list.h``).  One big advantage of this approach
> +is that all of the required memory barriers are included for you in
> +the list macros.  This document describes several applications of RCU,
> +with the best fits first.
> +
> +Example 1: Read-Side Action Taken Outside of Lock, No In-Place Updates
> +----------------------------------------------------------------------
> +
> +The best applications are cases where, if reader-writer locking were
> +used, the read-side lock would be dropped before taking any action
> +based on the results of the search.  The most celebrated example is
> +the routing table.  Because the routing table is tracking the state of
> +equipment outside of the computer, it will at times contain stale data.
> +Therefore, once the route has been computed, there is no need to hold
> +the routing table static during transmission of the packet.  After all,
> +you can hold the routing table static all you want, but that won't keep
> +the external Internet from changing, and it is the state of the external
> +Internet that really matters.  In addition, routing entries are typically
> +added or deleted, rather than being modified in place.
> +
> +A straightforward example of this use of RCU may be found in the
> +system-call auditing support.  For example, a reader-writer locked
> +implementation of *audit_filter_task()* might be as follows:

Please don't mark up function names that way.  Just leave them unadorned,
and soon we'll have the magic to handle all of that automatically.  Also,

> +implementation of *audit_filter_task()* might be as follows:
> +
> +.. code-block:: c
> +
> +   static enum audit_state audit_filter_task(struct task_struct *tsk)

It's usually better to just use "::" to indicate a literal block:

> implementation of audit_filter_task() might be as follows::
>
>    static enum audit_state ....

That minimizes the amount of non-text stuff that readers have to work
through.

Thanks,

jon
