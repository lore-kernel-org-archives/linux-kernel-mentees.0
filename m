From: johannes@sipsolutions.net (Johannes Berg)
Date: Fri, 28 Jun 2019 17:17:30 +0200
Subject: [Linux-kernel-mentees] [PATCH v2] nl80211: Fix undefined
 behavior in bit shift
In-Reply-To: <9e17c585-bd42-8c65-a37a-add6aa4d5ca4@linuxfoundation.org>
	(sfid-20190628_170419_565002_8FFEF936)
References: <20190627010137.5612-4-c0d1n61at3@gmail.com>
	<20190627032532.18374-4-c0d1n61at3@gmail.com>
	<c20a0a94-ab50-bb85-7c78-e02a465c5a40@linuxfoundation.org>
	<8b8c44c3ecb8626d9bb5a8f786b1d2b7488df86b.camel@sipsolutions.net>
	<9e17c585-bd42-8c65-a37a-add6aa4d5ca4@linuxfoundation.org>
	(sfid-20190628_170419_565002_8FFEF936)
Message-ID: <b5a247aa3bb21094c0a6ef1d8e3281d701bb6200.camel@sipsolutions.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190628151730._7k0zeFvsaqBLRH9wsT_5iSCd6r9P_FDrBcKKwnWcbA@z>

Hi Shuah,

> I went looking in the git log. Looks like there are several commits with
> "Changes since" included in the commit log. It still appears to be
> maintainer preference. Probably from networking and networking related
> areas - wireless being one of them. This trend is recent it appears in
> any case.

Yeah. I was really just observing that I'd seen this, and some people (I
guess 'many' was an exaggeration) actively request it to be in the
commit log. I "grew up" with "changelog after ---" too ;-)

> There is a value to seeing changes as the work evolves. However, there
> is the concern that how log should it be.

That doesn't parse, what did you mean?

> This example commit has history from RFC stage and no doubt very useful
> since this is a new driver.
> 
> 8ef988b914bd449458eb2174febb67b0f137b33c
> 
> If we make this more of a norm, we do want to make sure, we evolve
> from informal nature of these "Changes since", to "Commit log" text.

Not sure it's really worth it, but I guess some recommendations could be
useful. If it is indeed to become the norm, and there aren't some people
who strongly feel it should *not* be included.

johannes
