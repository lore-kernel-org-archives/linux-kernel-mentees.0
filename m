From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 27 Jun 2019 18:29:38 -0400
Subject: [Linux-kernel-mentees] [PATCH] doc: RCU callback locks need
 only _bh, not necessarily _irq
In-Reply-To: <20190627221045.GH26519@linux.ibm.com>
References: <20190627210147.19510-1-c0d1n61at3@gmail.com>
	<bc2ce605-56ab-33aa-c94d-d7774e6ce8cd@linuxfoundation.org>
	<20190627221045.GH26519@linux.ibm.com>
Message-ID: <20190627182938.306ab9d9@gandalf.local.home>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627222938.DNWkVluKyWij8Y-ZVBLY0Ooazgbi3zPsbMFioEHmr0w@z>

On Thu, 27 Jun 2019 15:10:45 -0700
"Paul E. McKenney" <paulmck at linux.ibm.com> wrote:

> On Thu, Jun 27, 2019 at 04:01:35PM -0600, Shuah Khan wrote:
> > On 6/27/19 3:01 PM, Jiunn Chang wrote:  
> > >The UP.rst file calls for locks acquired within RCU callback functions
> > >to use _irq variants (spin_lock_irqsave() or similar), which does work,
> > >but can be overkill.  This commit therefore instead calls for _bh variants
> > >(spin_lock_bh() or similar), while noting that _irq does work.
> > >
> > >Signed-off-by: Paul E. McKenney <paulmck at linux.ibm.com>  
> > 
> > Should this by Suggested-by?  
> 
> I wrote it and Jiunn converted my change to .rst, so I believe that
> this is correct as is.

Note, you did send Jiunn an explicit Signed-off-by when you wrote it,
correct? As Signed-off-by is equivalent to a signature.

-- Steve
