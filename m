From: corbet@lwn.net (Jonathan Corbet)
Date: Sun, 23 Jun 2019 18:43:43 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 3/7] Documentation: RCU:
 Convert RCU linked list to ReST
In-Reply-To: <20190623081413.7095-4-c0d1n61at3@gmail.com>
References: <20190622090046.178d9d16@lwn.net>
	<20190623081413.7095-4-c0d1n61at3@gmail.com>
Message-ID: <20190623184343.4a6d901c@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190624004343.pIyo41vzj50xpGLOTc3ssIO2_XAxzDRMnW4peyV8uOE@z>

On Sun, 23 Jun 2019 03:14:09 -0500
Jiunn Chang <c0d1n61at3 at gmail.com> wrote:

> ReST markup and TOC tree hook.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  Documentation/RCU/index.rst   |  1 +
>  Documentation/RCU/listRCU.txt | 33 +++++++++++++++++++--------------
>  2 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> index bc8cd42a91cc..5a19c3642e88 100644
> --- a/Documentation/RCU/index.rst
> +++ b/Documentation/RCU/index.rst
> @@ -8,6 +8,7 @@ RCU concepts
>     :maxdepth: 1
>  
>     rcu
> +   list_rcu
>  
>  .. only:: subproject and html
>  
> diff --git a/Documentation/RCU/listRCU.txt b/Documentation/RCU/listRCU.txt
> index adb5a3782846..f786cd82c6a7 100644
> --- a/Documentation/RCU/listRCU.txt
> +++ b/Documentation/RCU/listRCU.txt
> @@ -1,14 +1,16 @@
> -Using RCU to Protect Read-Mostly Linked Lists
> +.. _list_rcu_doc:
>  
> +Using RCU to Protect Read-Mostly Linked Lists
> +=============================================
>  
>  One of the best applications of RCU is to protect read-mostly linked lists
> -("struct list_head" in list.h).  One big advantage of this approach
> +(*struct list_head* in ``list.h``).  One big advantage of this approach

Thanks for taking out the function markup from before; now I'll ask you to
take out this markup as well.  As a general rule, we try to use the minimal
amount of markup possible in our documentation in order to maximize the
readability of the .rst files.

Thanks,

jon
