From: paulmck@linux.ibm.com (Paul E. McKenney)
Date: Tue, 25 Jun 2019 14:45:29 -0700
Subject: [Linux-kernel-mentees] [PATCH v3 5/6] Documentation: RCU: Add
 links to rcu.rst
In-Reply-To: <20190625154010.557448ff@lwn.net>
References: <20190623081413.7095-1-c0d1n61at3@gmail.com>
	<20190625062627.26378-6-c0d1n61at3@gmail.com>
	<20190625155623.GA26519@linux.ibm.com>
	<20190625150155.5c9b8880@lwn.net>
	<20190625211740.GQ26519@linux.ibm.com>
	<20190625154010.557448ff@lwn.net>
Message-ID: <20190625214529.GS26519@linux.ibm.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190625214529.3m20i4Gab4WA8ABL7mRf4iPsWczg6TeK8Lk9a5zQzNU@z>

On Tue, Jun 25, 2019 at 03:40:10PM -0600, Jonathan Corbet wrote:
> On Tue, 25 Jun 2019 14:17:40 -0700
> "Paul E. McKenney" <paulmck at linux.ibm.com> wrote:
> 
> > > Certainly "up_rcu" seems like a better name.  I do believe, though, that
> > > you can also use the title directly:
> > > 
> > >   See `RCU on Uniprocessor Systems`_ for more information  
> > 
> > That does look prettier, though we might want to do something more
> > directly mapped for people directly reading the .rst files.
> 
> Yeah, the alternative there is to just say "Documentation/RCU/UP.rst".
> It's vaporware at the moment, but the plan is to recognize such strings
> and link them up automatically in the build process.  It's easy enough to
> do, I just have to get around to it.  In anticipation of that, just
> putting in the file name is probably the right thing to do.

Works for me!  Easy enough to cut-and-paste the filename into the
corresponding portion of the URL, in the meantime.

							Thanx, Paul
