From: lnowakow@eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Mon, 8 Jul 2019 13:28:08 -0700
Subject: [Linux-kernel-mentees] [PATCH 1/3] Documentation: virtual: Add
	toctree hooks
In-Reply-To: <20190708135404.3eeed68f@lwn.net>
References: <cover.1562448500.git.lnowakow@eng.ucsd.edu>
	<ef1edb15bd6a6ef87abf4fef7636cd9213450e3c.1562448500.git.lnowakow@eng.ucsd.edu>
	<20190708135404.3eeed68f@lwn.net>
Message-ID: <20190708202808.GA8859@luke-XPS-13>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190708202808.HAA30BSdXb3pDto5xncqWENTVs1q_jx_yNYHrBL_adU@z>

On Mon, Jul 08, 2019 at 01:54:04PM -0600, Jonathan Corbet wrote:
> On Sat,  6 Jul 2019 14:38:13 -0700
> Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu> wrote:
> 
 
> At this point in the patch series, the above-mentioned RST files don't
> exist.  So if somebody tries to build the docs here, the build will fail.
> I suspect that it's pretty rare for people to use bisection with docs
> builds, but it's still proper practice to ensure that things work at every
> step in your series.  So the above entries should be added in the patches
> that convert the files.
>

Yes, agreed. It should be at the end of the series. 

> Also, vcpu-requests.txt is never touched in this patch series, which
> suggests that you didn't build the docs even at the end of it.
> 

In the staging tree I was doing work out of I saw a vcpu-requests.rst
file so thought I could add it "while I'm here". 

You're right. I should only add the files I am converting. 

> Thanks,
> 
> jon

Thanks again, 
- Luke
