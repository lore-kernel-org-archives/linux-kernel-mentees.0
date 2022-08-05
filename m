Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AEFC3F6B0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 06:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49D988294A;
	Fri,  5 Aug 2022 06:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D988294A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Sxdyg77b
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hv7BCNTV4g4W; Fri,  5 Aug 2022 06:29:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5D92D829FD;
	Fri,  5 Aug 2022 06:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D92D829FD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 343B8C0032;
	Fri,  5 Aug 2022 06:29:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57B2EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 06:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 319DA6F937
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 06:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 319DA6F937
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Sxdyg77b
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47DvR76yUegr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 06:29:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B6896F936
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B6896F936
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 06:29:26 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so590896pjm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 04 Aug 2022 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=66sTXdJI9D/uDofdTmj8j7tOsf58bY5fHMNycNv2J+8=;
 b=Sxdyg77bcCLSPX470DdsbQZEx5dV699VcOaq5ukagYnFSrvwC6HCy6vHuf29m2kzp6
 6jlO5vrBv6NObDGMAjeraj5FLjwX4Tp57UVpDYadL+P63SZnQR2VEepuzrElBjCWGE8/
 +V6pk4L1PxDZwIuzbVDBKMz6WLi0M1IjfDen82CXXNhEWXDk+qM9p/pLtMdIvmNo2PJT
 WHk8uGpaVfr3eJ9XKUIyyzUTYWXCgzKqEwS5ozEO9N/nS/wbPBA5xXHiRKnxWY9Wzagj
 Tv9LS/prQ9/4JbanwL3geBEP5n6WIzJHm3X1kW3HTTAuocL1BTGLHwnPRpnzbUWWbSQl
 ZW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=66sTXdJI9D/uDofdTmj8j7tOsf58bY5fHMNycNv2J+8=;
 b=vTEfbjzJIQbU9X033vk2De/zUbaampEfECmTzOziCnKmLoc1uvhhfsU5ADAsrJnZzJ
 eAvGHUIW+kUTB26BuKwJnTnjER2xM67/Lj/SMsAe8Zz/3RmPDqkpszvOcrLDVdNV3Q9F
 caR8H4Orga3PqKTj7tbsiIQ4Stpq9ABTtp0Foe0G+CVMvc/4D/qoBCQTmfLWpUJmfo/8
 GVUlEft8yO7ptlx72jFnnaZpQCZB3F12RtM4zmdM3vPyCPbPpMiDjzURyqP7YUG68ro6
 OYGpHvKh6BnJfgz3B6lwQAhrR04bjidKlg7M/c818e++m99jOC2uSrwlUeEhJpRLbrxk
 BlIQ==
X-Gm-Message-State: ACgBeo197PcqiTUlbPXGWg3az7gBhHJIRFMsazwe8sxJLA8MRmyQZpeg
 89zvTJj2/TPP/6jsizC7zEs=
X-Google-Smtp-Source: AA6agR6UmBwWOgZYHRJ2y4V+wTp2HKx/I92yQS+ZTaDQ6QxXZrn2yn1rC0fWpJKkVCxNVmTpSak5dw==
X-Received: by 2002:a17:90a:558f:b0:1f5:bbc:c58e with SMTP id
 c15-20020a17090a558f00b001f50bbcc58emr14305788pji.102.1659680965733; 
 Thu, 04 Aug 2022 23:29:25 -0700 (PDT)
Received: from localhost ([117.136.0.155]) by smtp.gmail.com with ESMTPSA id
 m17-20020a170902d19100b0016d83ed0a2csm2056223plb.80.2022.08.04.23.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 23:29:25 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: kuba@kernel.org
Subject: Re: [PATCH v4] net: fix refcount bug in sk_psock_get (2)
Date: Fri,  5 Aug 2022 14:28:44 +0800
Message-Id: <20220805062844.89787-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804082913.5dac303c@kernel.org>
References: <20220804082913.5dac303c@kernel.org>
MIME-Version: 1.0
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 jakub@cloudflare.com, daniel@iogearbox.net, davem@davemloft.net,
 borisp@nvidia.com, paskripkin@gmail.com, john.fastabend@gmail.com,
 andrii@kernel.org, yhs@fb.com, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, yin31149@gmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kgraul@linux.ibm.com, guwen@linux.alibaba.com,
 bpf@vger.kernel.org, kafai@fb.com
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

On Thu, 4 Aug 2022 at 23:29, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu,  4 Aug 2022 11:05:15 +0800 Hawkins Jiawei wrote:
> > I wonder if it is proper to gather these together in a patchset, for
> > they are all about flags in sk_user_data, maybe:
> >
> > [PATCH v5 0/2] net: enhancement to flags in sk_user_data field
> >       - introduce the patchset
> >
> > [PATCH v5 1/2] net: clean up code for flags in sk_user_data field
> >       - refactor the things in include/linux/skmsg.h and
> > include/net/sock.h
> >       - refactor the flags's usage by other code, such as
> > net/core/skmsg.c and kernel/bpf/reuseport_array.c
> >
> > [PATCH v5 2/2] net: fix refcount bug in sk_psock_get (2)
> >       - add SK_USER_DATA_PSOCK flag in sk_user_data field
>
> Usually the fix comes first, because it needs to be backported to
> stable, and we don't want to have to pull extra commits into stable
> and risk regressions in code which was not directly involved in the bug.
Ok, I got it. Thanks for the explanation.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
