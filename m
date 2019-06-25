From: paulmck at linux.ibm.com (Paul E. McKenney)
Date: Tue, 25 Jun 2019 08:56:23 -0700
Subject: [Linux-kernel-mentees] [PATCH v3 5/6] Documentation: RCU: Add
 links to rcu.rst
In-Reply-To: <20190625062627.26378-6-c0d1n61at3@gmail.com>
References: <20190623081413.7095-1-c0d1n61at3@gmail.com>
	<20190625062627.26378-6-c0d1n61at3@gmail.com>
Message-ID: <20190625155623.GA26519@linux.ibm.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Jun 25, 2019 at 01:26:26AM -0500, Jiunn Chang wrote:
> Add the following links:
>   - list_rcu
>   - up_rcu
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  Documentation/RCU/rcu.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/RCU/rcu.rst b/Documentation/RCU/rcu.rst
> index 000da07d683e..d145decb5c39 100644
> --- a/Documentation/RCU/rcu.rst
> +++ b/Documentation/RCU/rcu.rst
> @@ -10,8 +10,8 @@ A "grace period" must elapse between the two parts, and this grace period
>  must be long enough that any readers accessing the item being deleted have
>  since dropped their references.  For example, an RCU-protected deletion
>  from a linked list would first remove the item from the list, wait for
> -a grace period to elapse, then free the element.  See the listRCU.txt
> -file for more information on using RCU with linked lists.
> +a grace period to elapse, then free the element.  See :ref:`list_rcu`
> +for more information on using RCU with linked lists.
>  
>  Frequently Asked Questions
>  --------------------------
> @@ -49,7 +49,7 @@ Frequently Asked Questions
>  - If I am running on a uniprocessor kernel, which can only do one
>    thing at a time, why should I wait for a grace period?
>  
> -  See the UP.txt file in this directory.
> +  See :ref:`up_rcu` for more information.

This rendered as straight text after "make htmldocs" instead of producing
a link in the HTML output.  The HTML itself is:

	<span class="xref std std-ref">up_rcu</span>

This doesn't look like something that would create a link, though I
freely admit that my HTML is rather outdated.

>  - How can I see where RCU is currently used in the Linux kernel?
>  
> @@ -67,7 +67,7 @@ Frequently Asked Questions
>  
>  - Why the name "RCU"?
>  
> -  "RCU" stands for "read-copy update".  The file listRCU.txt has
> +  "RCU" stands for "read-copy update".  :ref:`list_rcu` has

Same here for list_rcu.

							Thanx, Paul

>    more information on where this name came from, search for
>    "read-copy update" to find it.
>  
> -- 
> 2.22.0
> 
