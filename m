From: bnvandana@gmail.com (Vandana BN)
Date: Wed, 17 Jul 2019 17:44:28 +0530
Subject: [Linux-kernel-mentees] analysis -syzbot :KASAN:
	global-out-of-bounds Read in dvb_pll_attach
Message-ID: <a37e47be-68af-973b-4c43-92d550120f30@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190717121428.ot3e24Ncdmbh_fHEDOviineouW6Dtly7vI2y6G8VZCE@z>

Hello,

I analysed the syzbot bug : https://syzkaller.appspot.com/bug?id=7f97adccc1f9c4a69f7db8daabf1e662117e18de

Its global out of bounds in dvb_pll_attach, while accessing id.

??????? if ((id[dvb_pll_devcount] > DVB_PLL_UNDEFINED) &&
??????????? (id[dvb_pll_devcount] < ARRAY_SIZE(pll_list)))
??????????????? pll_desc_id = id[dvb_pll_devcount];

this happends because , the dvb_pll_devcount is more than the size of array id DVB_PLL_MAX.

also, In logs, we can see, dvb_pll 2-0060: DVB Simple Tuner attached is called 64 times, and 65th call causes this bug.

The fix is to check if dvb_pll_devcount has reached DVB_PLL_MAX, if so return from there. as no more devices can be attached.

With this fix syzbot doesn't see the issue.

https://groups.google.com/d/msg/syzkaller-bugs/4IyprfsSUe4/v3IlSYPbDwAJ

Regards,

Vandana.
