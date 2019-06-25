From: corbet@lwn.net (Jonathan Corbet)
Date: Tue, 25 Jun 2019 15:01:55 -0600
Subject: [Linux-kernel-mentees] [PATCH v3 5/6] Documentation: RCU: Add
 links to rcu.rst
In-Reply-To: <20190625155623.GA26519@linux.ibm.com>
References: <20190623081413.7095-1-c0d1n61at3@gmail.com>
	<20190625062627.26378-6-c0d1n61at3@gmail.com>
	<20190625155623.GA26519@linux.ibm.com>
Message-ID: <20190625150155.5c9b8880@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190625210155.SN5vHcTzsPkvLwlsEWRWlxpwTjHD8VRvfm9a6dS2aA4@z>

On Tue, 25 Jun 2019 08:56:23 -0700
"Paul E. McKenney" <paulmck at linux.ibm.com> wrote:

> > -  See the UP.txt file in this directory.
> > +  See :ref:`up_rcu` for more information.  
> 
> This rendered as straight text after "make htmldocs" instead of producing
> a link in the HTML output.  The HTML itself is:
> 
> 	<span class="xref std std-ref">up_rcu</span>
> 
> This doesn't look like something that would create a link, though I
> freely admit that my HTML is rather outdated.

The problem is that the reference target isn't called "up_rcu" in the file
itself:

> diff --git a/Documentation/RCU/UP.txt b/Documentation/RCU/UP.txt
> index 53bde717017b..67715a47ae89 100644
> --- a/Documentation/RCU/UP.txt
> +++ b/Documentation/RCU/UP.txt
> @@ -1,17 +1,19 @@
> -RCU on Uniprocessor Systems
> +.. _up_doc:

Certainly "up_rcu" seems like a better name.  I do believe, though, that
you can also use the title directly:

  See `RCU on Uniprocessor Systems`_ for more information

> >  - How can I see where RCU is currently used in the Linux kernel?
> >  
> > @@ -67,7 +67,7 @@ Frequently Asked Questions
> >  
> >  - Why the name "RCU"?
> >  
> > -  "RCU" stands for "read-copy update".  The file listRCU.txt has
> > +  "RCU" stands for "read-copy update".  :ref:`list_rcu` has  
> 
> Same here for list_rcu.

And the problem is the same, it's list_rcu_doc in the actual source file.

Jiang, as with so many things in software, if you haven't tested it, it
probably doesn't work.  Please actually run "make htmldocs" and look at
the results to be sure that they are what you expect.  (Along those lines,
it would also be good to add the new directory to Documentation/index.rst
so that it gets built with the rest).

Thanks,

jon
