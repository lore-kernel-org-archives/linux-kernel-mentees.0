Return-Path: <SRS0=I4PQ=62=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18385C2D0F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 May 2020 17:17:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB3B2205ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 May 2020 17:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jt8V3ism"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB3B2205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7C60C26510;
	Tue, 12 May 2020 17:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cUbJU1T04RY; Tue, 12 May 2020 17:17:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B08F2040E;
	Tue, 12 May 2020 17:17:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6022BC088A;
	Tue, 12 May 2020 17:17:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B60D6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 17:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 98D818867D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 17:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N+SDFslB+Kgd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 17:17:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9885388673
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 17:17:20 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id m7so5639587plt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tXAZoRNX8tZ/6EQMyUYBzacN+LIvXZZRD9xf5drn8ZI=;
 b=jt8V3ismwXLipKUvEGIMwtCvLxCayPzDHUVwVVqdhbu/LlVrfl6jPdX3JP57nZdIsu
 g4xW2/EOFGSjH2iEfO2iu6UrtEYKUSSCi8jtc4p7a4WOhIQtiVjcmd0NYUN47GMYyKey
 lSZPZfLD7zkSOMMsjBvDUbCfFvyEJlNMvAXPIfbdCUgGX1JdSXSMBH/7Xk6c59/qzCp2
 euoE1gq0j7FvG+cz5REZ4AV0r6ZZDWu4f+u6JGipMwoDzTIdx3QS/nrBf1KUC2kwduH9
 B7tFKVIcmhB6HK1jxE7nNtNm5yaqjo6Ad2khV8m1QyAfQctd0Ysiy/GSCN+wqU/BbvG5
 tRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tXAZoRNX8tZ/6EQMyUYBzacN+LIvXZZRD9xf5drn8ZI=;
 b=NvEWUEmNIpedBkujwhyEZzvGpV16fpEjailzMLnj/88XmKborK//9k5DPfQjrpl5o9
 mdEAVyxQO4HCwOpnrzqvWJYiYmFkZcD7fUd9iEWj9EkHXpi4mD6wy8ChqgH2YD/9loU2
 gaBQtLhohzYEsjpUR6SxUM/X4T+lmTVKgsv7Fp0HhJqwg55PLWSbCzBxwEf5kUSNWAmE
 JKUKqt66DiAOXpwX7epXawpBM/4/MWzzonxrLzfud7R3agnixlMwNxx9xVLzKdf4XkR6
 Aj/zxlT53OvHfcIq7aej9SOQvwaftJVn6G+i5dDT1w+zfzb+ivovM74hDDXbLV0/h7OM
 Lhdg==
X-Gm-Message-State: AGi0PubseYvMMqPRvlmX6P5sMGVe6UZ7DyVfA30MCjqQ1um5QDuw8c61
 9BBDCBX/k1pJYfXJGvXmgaDT9G/Etu8=
X-Google-Smtp-Source: APiQypIl47oYaeGY2xTNApuTgWo0XK5qKmvLWZ+Gd8ugRvIUZeXXu+5hhwWlJSqXVkXCMsSgx+Ic8w==
X-Received: by 2002:a17:90a:20ea:: with SMTP id
 f97mr29734906pjg.157.1589303839987; 
 Tue, 12 May 2020 10:17:19 -0700 (PDT)
Received: from workstation-portable ([103.87.56.156])
 by smtp.gmail.com with ESMTPSA id x185sm12451341pfx.155.2020.05.12.10.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 10:17:19 -0700 (PDT)
Date: Tue, 12 May 2020 22:47:10 +0530
From: Amol Grover <frextrite@gmail.com>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Message-ID: <20200512171710.GA3200@workstation-portable>
References: <20200509072243.3141-1-frextrite@gmail.com>
 <20200509072243.3141-2-frextrite@gmail.com>
 <20200509141938.028fa959@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20200512051705.GB9585@madhuparna-HP-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512051705.GB9585@madhuparna-HP-Notebook>
Cc: sfr@canb.auug.org.au, "Paul E . McKenney" <paulmck@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH net 2/2 RESEND] ipmr: Add lockdep
 expression to ipmr_for_each_table macro
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, May 12, 2020 at 10:47:05AM +0530, Madhuparna Bhowmik wrote:
> On Sat, May 09, 2020 at 02:19:38PM -0700, Jakub Kicinski wrote:
> > On Sat,  9 May 2020 12:52:44 +0530 Amol Grover wrote:
> > > ipmr_for_each_table() uses list_for_each_entry_rcu() for
> > > traversing outside of an RCU read-side critical section but
> > > under the protection of pernet_ops_rwsem. Hence add the
> > > corresponding lockdep expression to silence the following
> > > false-positive warning at boot:
> > 
> > Thanks for the fix, the warning has been annoying me as well!
> > 
> > > [    0.645292] =============================
> > > [    0.645294] WARNING: suspicious RCU usage
> > > [    0.645296] 5.5.4-stable #17 Not tainted
> > > [    0.645297] -----------------------------
> > > [    0.645299] net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!
> > 
> > please provide a fuller stack trace, it would have helped the review
> > 
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  net/ipv4/ipmr.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
> > > index 99c864eb6e34..950ffe9943da 100644
> > > --- a/net/ipv4/ipmr.c
> > > +++ b/net/ipv4/ipmr.c
> > > @@ -109,9 +109,10 @@ static void mroute_clean_tables(struct mr_table *mrt, int flags);
> > >  static void ipmr_expire_process(struct timer_list *t);
> > >  
> > >  #ifdef CONFIG_IP_MROUTE_MULTIPLE_TABLES
> > > -#define ipmr_for_each_table(mrt, net) \
> > > -	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list, \
> > > -				lockdep_rtnl_is_held())
> > > +#define ipmr_for_each_table(mrt, net)					\
> > > +	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
> > > +				lockdep_rtnl_is_held() ||		\
> > > +				lockdep_is_held(&pernet_ops_rwsem))
> > 
> > This is a strange condition, IMHO. How can we be fine with either
> > lock.. This is supposed to be the writer side lock, one can't have 
> > two writer side locks..
> > 
> > I think what is happening is this:
> > 
> > ipmr_net_init() -> ipmr_rules_init() -> ipmr_new_table()
> > 
> > ipmr_new_table() returns an existing table if there is one, but
> > obviously none can exist at init.  So a better fix would be:
> > 
> > #define ipmr_for_each_table(mrt, net)					\
> > 	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
> > 				lockdep_rtnl_is_held() ||		\
> > 				list_empty(&net->ipv4.mr_tables))
> >

Jakub, I agree, this condition looks better (and correct) than the one I
proposed. I'll do the changes as necessary. Also, do you want me to add
the full trace to the git commit body as well? I omitted it on purpose
to not make it messy.

> (adding Stephen)
> 
> Hi Jakub,
> 
> Thank you for your suggestion about this patch.
> Here is a stack trace for ipmr.c:
> 
> [    1.515015] TCP: Hash tables configured (established 8192 bind 8192)
> [    1.516790] UDP hash table entries: 512 (order: 3, 49152 bytes, linear)
> [    1.518177] UDP-Lite hash table entries: 512 (order: 3, 49152 bytes, linear)
> [    1.519805]
> [    1.520178] =============================
> [    1.520982] WARNING: suspicious RCU usage
> [    1.521798] 5.7.0-rc2-00006-gb35af6a26b7c6f #1 Not tainted
> [    1.522910] -----------------------------
> [    1.523671] net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!
> [    1.525218]
> [    1.525218] other info that might help us debug this:
> [    1.525218]
> [    1.526731]
> [    1.526731] rcu_scheduler_active = 2, debug_locks = 1
> [    1.528004] 1 lock held by swapper/1:
> [    1.528714]  #0: c20be1d8 (pernet_ops_rwsem){+.+.}-{3:3}, at: register_pernet_subsys+0xd/0x30
> [    1.530433]
> [    1.530433] stack backtrace:
> [    1.531262] CPU: 0 PID: 1 Comm: swapper Not tainted 5.7.0-rc2-00006-gb35af6a26b7c6f #1
> [    1.532729] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [    1.534305] Call Trace:
> [    1.534758]  ? ipmr_get_table+0x3c/0x70
> [    1.535430]  ? ipmr_new_table+0x1c/0x60
> [    1.536173]  ? ipmr_net_init+0x7b/0x170
> [    1.536923]  ? register_pernet_subsys+0xd/0x30
> [    1.537810]  ? ops_init+0x1a0/0x1e0
> [    1.538518]  ? kmem_cache_create_usercopy+0x28a/0x350
> [    1.539752]  ? register_pernet_operations+0xc9/0x1c0
> [    1.540630]  ? ipv4_offload_init+0x65/0x65
> [    1.541451]  ? register_pernet_subsys+0x19/0x30
> [    1.542357]  ? ip_mr_init+0x28/0xff
> [    1.543079]  ? inet_init+0x17b/0x249
> [    1.543773]  ? do_one_initcall+0xc5/0x240
> [    1.544532]  ? parse_args+0x192/0x350
> [    1.545266]  ? rcu_read_lock_sched_held+0x2f/0x60
> [    1.546180]  ? trace_initcall_level+0x61/0x93
> [    1.547061]  ? kernel_init_freeable+0x112/0x18a
> [    1.547978]  ? kernel_init_freeable+0x12b/0x18a
> [    1.548974]  ? rest_init+0x220/0x220
> [    1.549792]  ? kernel_init+0x8/0x100
> [    1.550548]  ? rest_init+0x220/0x220
> [    1.551288]  ? schedule_tail_wrapper+0x6/0x8
> [    1.552136]  ? rest_init+0x220/0x220
> [    1.552873]  ? ret_from_fork+0x2e/0x38
> 

Thank you for the stacktrace Madhuparna.

> ALso, there is a similar warning for ip6mr.c :
> 
> =============================
> WARNING: suspicious RCU usage
> 5.7.0-rc4-next-20200507-syzkaller #0 Not tainted
> -----------------------------
> net/ipv6/ip6mr.c:124 RCU-list traversed in non-reader section!!
> 
> other info that might help us debug this:
> 
> rcu_scheduler_active = 2, debug_locks = 1
> 1 lock held by swapper/0/1:
> #0: ffffffff8a7aae30 (pernet_ops_rwsem){+.+.}-{3:3}, at: register_pernet_subsys+0x16/0x40 net/core/net_namespace.c:1257
> 
> stack backtrace:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc4-next-20200507-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
> __dump_stack lib/dump_stack.c:77 [inline]
> dump_stack+0x18f/0x20d lib/dump_stack.c:118
> ip6mr_get_table+0x153/0x180 net/ipv6/ip6mr.c:124
> ip6mr_new_table+0x1b/0x70 net/ipv6/ip6mr.c:382
> ip6mr_rules_init net/ipv6/ip6mr.c:236 [inline]
> ip6mr_net_init+0x133/0x3f0 net/ipv6/ip6mr.c:1310
> ops_init+0xaf/0x420 net/core/net_namespace.c:151
> __register_pernet_operations net/core/net_namespace.c:1140 [inline]
> register_pernet_operations+0x346/0x840 net/core/net_namespace.c:1217
> register_pernet_subsys+0x25/0x40 net/core/net_namespace.c:1258
> ip6_mr_init+0x49/0x152 net/ipv6/ip6mr.c:1363
> inet6_init+0x1d7/0x6dc net/ipv6/af_inet6.c:1037
> do_one_initcall+0x10a/0x7d0 init/main.c:1159
> do_initcall_level init/main.c:1232 [inline]
> do_initcalls init/main.c:1248 [inline]
> do_basic_setup init/main.c:1268 [inline]
> kernel_init_freeable+0x501/0x5ae init/main.c:1454
> kernel_init+0xd/0x1bb init/main.c:1359
> ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
> Segment Routing with IPv6
> mip6: Mobile IPv6
> sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> ip6_gre: GRE over IPv6 tunneling driver
> 
> > Thoughts?
> 
> Do you think a similar fix (the one you suggested) is also applicable
> in the ip6mr case.
> 
> Thank you,
> Madhuparna
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
