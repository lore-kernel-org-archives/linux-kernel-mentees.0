From: davem@davemloft.net (David Miller)
Date: Wed, 26 Jun 2019 13:03:48 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] net: fddi: skfp: Use PCI
 generic definitions instead of private duplicates
In-Reply-To: <5f04f52d-8911-4db9-4321-00334d357d54@linuxfoundation.org>
References: <20190621094607.15011-1-puranjay12@gmail.com>
	<20190621162024.53620dd9@alans-desktop>
	<5f04f52d-8911-4db9-4321-00334d357d54@linuxfoundation.org>
Message-ID: <20190626.130348.743645536748522991.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190626200348.7ovddoiZu92vfRCCLyYUzJzP-cuy1TJ3PxHWCtr95y4@z>

From: Shuah Khan <skhan@linuxfoundation.org>
Date: Fri, 21 Jun 2019 10:36:02 -0600

> Stephen Hemminger is suggesting removal as well. Makes sense to me.
 ...
> What would you recommend the next steps are? Would like driver
> removed?

If you hadn't proposed the cleanups nobody would have said to remove
this driver.  Really if someone wants to go through the tree and
send removal patches for seemingly really unused drivers, that is
a separate piece of work unrelated to your cleanup.

While something still is in the tree we should clean it up from
stuff like this.

Therefore, I'll be applying v5 of your changes, thanks.
