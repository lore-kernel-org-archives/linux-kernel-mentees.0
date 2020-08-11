Return-Path: <SRS0=BcdZ=BV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020D7C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 05:09:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DEF2073E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 05:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLBzjVCO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DEF2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7168485A80;
	Tue, 11 Aug 2020 05:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u83RF0kB-1rN; Tue, 11 Aug 2020 05:09:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E95E68522E;
	Tue, 11 Aug 2020 05:09:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0145C07FF;
	Tue, 11 Aug 2020 05:09:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39BD1C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 05:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 291BC8522E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 05:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVqp2ynZIvSm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 05:09:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 42F6D8487B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 05:09:33 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id n129so4984573qkd.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 22:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bMSxjMPm7VjNJMk372pm84tQNgfCuUZD1VrmgkqYZCk=;
 b=eLBzjVCO5YbxLczQR30kyge47su0iVcJrFjbDeldqpgB2hjXU5IW3vXcQ8JtxRodoF
 qhbLl6bjXO7Jlw5cfCnfSLBt+UguSzjYM/bCiq6Xxpf+ZkzFhamxpFsXgZzbBx6bwrRb
 AnpIjg5QVPT1+z+Qpl+qqYHwXJoByhiyqO//u5t9q3f2ygLnkR8e72dL3xFxHLsAbyRH
 0oluLqNNUANwqEYLXSTn4UMI+9lJTfM97LFe+l/JXOJSCK689qf99iDm1Firfr0u/GSu
 UpgsbvWWHqyyqD/O1gvgX4uLDpJCVFTDiHOJmuk2+ojKOft0M7v7IHvKcYcncAIGKVzp
 EkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bMSxjMPm7VjNJMk372pm84tQNgfCuUZD1VrmgkqYZCk=;
 b=I+/6lnDpW+7TqSMC5qBQCEkLmw+3RWuuQHj4Z4RmhKdNn7OmeG14ZmgHwHIlqYWFS8
 TFmWr7ka5Im1RrFBeEwlBMkL1I+Yf/331WO3iw/v5D3Cw/JebvgVZUioD5TEE1mS6soT
 xKCsrBwe1gm89LxPUX/YOchlhfNiw2+Cq617a3Sw0xHmaHVEOSuKc5qYaHj4flzKu7eL
 Qu+b64wjJ0WR39W8KIUlC+aWHvdDqqHkE1h+ctcedGK9yD6E6HW7iP0Gy427jtBQvqDL
 1rFUzxCi8NZF7qyEJJyiZx2aBDWLusgJTA49Bk1evcqwtWj0Nin/7y1VDVpixDilMjZ2
 L3gQ==
X-Gm-Message-State: AOAM531Gj4C7ZV8B4SpEjDC6+vTjYFviDWsHSOY1d7+UwEtsH+ojJ7x4
 +C9Kfbo40bRmHz1OCLT7cg==
X-Google-Smtp-Source: ABdhPJx2Ee81fca74pCzQRr0gAjmwBmoPjLgb54zYmDsOm6OFBy2IQqatW+oGAXQ0UUv+/hmSrUZKA==
X-Received: by 2002:ae9:f301:: with SMTP id p1mr28616754qkg.295.1597122572273; 
 Mon, 10 Aug 2020 22:09:32 -0700 (PDT)
Received: from PWN
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id l189sm15659624qke.67.2020.08.10.22.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 22:09:31 -0700 (PDT)
Date: Tue, 11 Aug 2020 01:09:29 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Message-ID: <20200811050929.GA821443@PWN>
References: <20200810220703.796718-1-yepeilin.cs@gmail.com>
 <CAM_iQpWsQubVJ-AYaLHujHwz68+nsHBcbgbf8XPMEPD=Vu+zaA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM_iQpWsQubVJ-AYaLHujHwz68+nsHBcbgbf8XPMEPD=Vu+zaA@mail.gmail.com>
Cc: Wensong Zhang <wensong@linux-vs.org>, coreteam@netfilter.org,
 Florian Westphal <fw@strlen.de>, LKML <linux-kernel@vger.kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, lvs-devel@vger.kernel.org,
 Julian Anastasov <ja@ssi.bg>, Simon Horman <horms@verge.net.au>,
 NetFilter <netfilter-devel@vger.kernel.org>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [Linux-kernel-mentees] [PATCH net] ipvs: Fix uninit-value in
 do_ip_vs_set_ctl()
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

On Mon, Aug 10, 2020 at 08:57:19PM -0700, Cong Wang wrote:
> On Mon, Aug 10, 2020 at 3:10 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > do_ip_vs_set_ctl() is referencing uninitialized stack value when `len` is
> > zero. Fix it.
> 
> Which exact 'cmd' is it here?
> 
> I _guess_ it is one of those uninitialized in set_arglen[], which is 0.

Yes, it was `IP_VS_SO_SET_NONE`, implicitly initialized to zero.

> But if that is the case, should it be initialized to
> sizeof(struct ip_vs_service_user) instead because ip_vs_copy_usvc_compat()
> is called anyway. Or, maybe we should just ban len==0 case.

I see. I think the latter would be easier, but we cannot ban all of
them, since the function does something with `IP_VS_SO_SET_FLUSH`, which
is a `len == 0` case.

Maybe we do something like this?

@@ -2432,6 +2432,8 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)

 	if (cmd < IP_VS_BASE_CTL || cmd > IP_VS_SO_SET_MAX)
 		return -EINVAL;
+	if (len == 0 && cmd != IP_VS_SO_SET_FLUSH)
+		return -EINVAL;
 	if (len != set_arglen[CMDID(cmd)]) {
 		IP_VS_DBG(1, "set_ctl: len %u != %u\n",
 			  len, set_arglen[CMDID(cmd)]);
@@ -2547,9 +2549,6 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
 		break;
 	case IP_VS_SO_SET_DELDEST:
 		ret = ip_vs_del_dest(svc, &udest);
-		break;
-	default:
-		ret = -EINVAL;
 	}

   out_unlock:

Thank you,
Peilin Ye

> In either case, it does not look like you fix it correctly.
> 
> Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
