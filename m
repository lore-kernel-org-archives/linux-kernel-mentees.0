From: paulmck at kernel.org (Paul E. McKenney)
Date: Fri, 1 Nov 2019 00:53:09 -0700
Subject: [Linux-kernel-mentees] [PATCH] Doc: convert whatisRCU.txt to rst
In-Reply-To: <35bb2f18-791a-caf3-957d-01e43a4b3afc@gmail.com>
References: <20191030233128.14997-1-tranmanphong@gmail.com>
	<20191031225439.GD20975@paulmck-ThinkPad-P72>
	<35bb2f18-791a-caf3-957d-01e43a4b3afc@gmail.com>
Message-ID: <20191101075309.GH20975@paulmck-ThinkPad-P72>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, Nov 01, 2019 at 08:17:36AM +0700, Phong Tran wrote:
> Hi Paul,
> On 11/1/19 5:54 AM, Paul E. McKenney wrote:
> > Could you and Madhuparna please review and test each other's
> > .rst-conversion patches?
> 
> It's fine.
> pull and "make SPHINXDIRS="RCU" htmldocs pdfdocs" rcu dev branch
> without error or warning.

Very good, thank you!

Once you have done that (or if you have already done that) and have
verified that the resulting .html and .pdf files for the changed portions
look good, you can respond with a Tested-by tag, which has "Tested-by:",
your name, and your email within "<" and ">".  For example, commit
127068abe85b ("i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga
C630") has this:

Tested-by: Bjorn Andersson <bjorn.andersson at linaro.org>

After you review the code, for example, by checking either the patch or the
resulting .rst file, you can respond with a very similar Reviewed-by tag.
Which allows you to get a start on participating in the code-review
process.

							Thanx, Paul
