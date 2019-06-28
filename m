From: johannes at sipsolutions.net (Johannes Berg)
Date: Fri, 28 Jun 2019 15:57:05 +0200
Subject: [Linux-kernel-mentees] [PATCH v2] nl80211: Fix undefined
 behavior in bit shift
In-Reply-To: <c20a0a94-ab50-bb85-7c78-e02a465c5a40@linuxfoundation.org>
	(sfid-20190627_053427_689527_6C7A1CBE)
References: <20190627010137.5612-4-c0d1n61at3@gmail.com>
	<20190627032532.18374-4-c0d1n61at3@gmail.com>
	<c20a0a94-ab50-bb85-7c78-e02a465c5a40@linuxfoundation.org>
	(sfid-20190627_053427_689527_6C7A1CBE)
Message-ID: <8b8c44c3ecb8626d9bb5a8f786b1d2b7488df86b.camel@sipsolutions.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, 2019-06-26 at 21:34 -0600, Shuah Khan wrote:
> On 6/26/19 9:25 PM, Jiunn Chang wrote:
> > Shifting signed 32-bit value by 31 bits is undefined.  Changing most
> > significant bit to unsigned.
> > 
> > Changes included in v2:
> >    - use subsystem specific subject lines
> >    - CC required mailing lists
> > 
> > Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> > ---
> 
> Move version change lines here. They don't belong in the commit log.

FWIW, in many cases people (maintainers) now *do* want them in the
commit log. Here, they're just editorial, so agree, but if real
technical changes were made due to reviews, they can indeed be useful.

johannes
