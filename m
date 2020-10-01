Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B71DC4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:45:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903F0207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0fB6fw6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 903F0207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4632C86A07;
	Thu,  1 Oct 2020 07:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lH9Exmhw6aCb; Thu,  1 Oct 2020 07:45:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D3F3E86A00;
	Thu,  1 Oct 2020 07:45:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9B71C0889;
	Thu,  1 Oct 2020 07:45:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A18F6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 90E0486C69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jf9M_lDY1iyd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:45:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2635F86C67
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:45:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b124so3685387pfg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VN3W20DodgO3Zj44IKBt6WsTun4/50u7wi6510gCoWM=;
 b=R0fB6fw60vBL+fvSnqvbYPeevGTqltgDvi5HpaeO9dZQ6jb10RvzDOw8A1hAWHCRdd
 ORftCMUJGrC1b8H/CtmUYxsKPbX7FCdvcLxjz0O36Z9bM7qK4vDkSCMBW7CvMs/LHT7V
 R//EW1hv2DTpnwM01hyFdl/v/PLFDi0MIk08374InPERQ4f6cpDfCjSZOJTE1xFhT1nn
 jHY7HGAjCN9BaSlAhV5+aIu/w3FfmYoXinaXp1CNTosESjXkEkXfSA9f+LponD86GRiH
 kq/IHdWzxj/3/iaj47zN9R5U/5X27pabKhsWGcIPL9nj9o9gHofrDSOX2AbsvV4qX+W7
 /NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VN3W20DodgO3Zj44IKBt6WsTun4/50u7wi6510gCoWM=;
 b=Oph9jeYI3l54mYWTTV/Ur+zgX5igELIuYDEX/ofeKhI5SeBYFduXLL5VHej9eyVVtI
 vFrqQ7Z6Ymzh2YtGRda2XNZhEitADGo9IqPYV/5y0/ljKReX7powZLp02StMgu1Zykec
 x4ZvXbscctnxqiYT61gdGZnLO9/mG8Ym8i2H/ShSRtbmpn23sQ+9NiAKBx6vyZ6vElVR
 AOXGm2SlDPeBTuaYEPmpL4WhjAnsBlxZrSK3lg48oaWRjfg5wAaywU4gkF2Py85JwkqU
 5M+vZw9BC4k+9jiyp4DY0F62zkMMLAYGcgwx5GCo9SIuVDQ6P/rVPVXvzS8fVyDN6DgC
 XtMA==
X-Gm-Message-State: AOAM532tQhtPMoooCFBzJAIqLAkUGmFKt8ig0VW7YvcOJIXgAaObQ/Iy
 kXNhBcseIa1drsxBCBqhZFM=
X-Google-Smtp-Source: ABdhPJyp/ch4/L9rwgW9lIvX03PzXqb7gcqp6y3SXn7GGpNuBIWkLZ6lziCkf2XU3gQNQmVI3e+esw==
X-Received: by 2002:a17:902:760b:b029:d1:9be4:856b with SMTP id
 k11-20020a170902760bb02900d19be4856bmr5766836pll.1.1601538348617; 
 Thu, 01 Oct 2020 00:45:48 -0700 (PDT)
Received: from Thinkpad ([45.118.167.207])
 by smtp.gmail.com with ESMTPSA id t24sm5316742pfq.37.2020.10.01.00.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 00:45:47 -0700 (PDT)
Date: Thu, 1 Oct 2020 13:15:40 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>
Message-ID: <20201001074540.GA428447@Thinkpad>
References: <20200929173231.396261-1-anmol.karan123@gmail.com>
 <20200930141813.410209-1-anmol.karan123@gmail.com>
 <6F6EF48D-561E-4628-A4F1-F1AF28743CAF@holtmann.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6F6EF48D-561E-4628-A4F1-F1AF28743CAF@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 syzbot+0bef568258653cff272f@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, open list <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: bluetooth: Fix null pointer
 dereference in hci_event_packet()
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

On Thu, Oct 01, 2020 at 09:06:42AM +0200, Marcel Holtmann wrote:
> Hi Anmol,
> 
> > AMP_MGR is getting derefernced in hci_phy_link_complete_evt(), when called from hci_event_packet() and there is a possibility, that hcon->amp_mgr may not be found when accessing after initialization of hcon.
> > 
> > - net/bluetooth/hci_event.c:4945
> > The bug seems to get triggered in this line:
> > 
> > bredr_hcon = hcon->amp_mgr->l2cap_conn->hcon;
> > 
> > Fix it by adding a NULL check for the hcon->amp_mgr before checking the ev-status.
> > 
> > Fixes: d5e911928bd8 ("Bluetooth: AMP: Process Physical Link Complete evt")
> > Reported-and-tested-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com 
> > Link: https://syzkaller.appspot.com/bug?extid=0bef568258653cff272f 
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > ---
> > Change in v3:
> >  - changed return o; to return; (Reported-by: kernel test robot <lkp@intel.com>
> > )
> > 
> > net/bluetooth/hci_event.c | 5 +++++
> > 1 file changed, 5 insertions(+)
> 
> patch has been applied to bluetooth-next tree.
> 
> Regards
> 
> Marcel
> 

Thank you :)

Best,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
