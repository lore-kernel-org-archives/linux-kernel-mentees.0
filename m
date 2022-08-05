Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B8BC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 15:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9829A83F0A;
	Fri,  5 Aug 2022 15:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9829A83F0A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wh4+prLA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXnTlVOfnoSn; Fri,  5 Aug 2022 15:37:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9ED0983F09;
	Fri,  5 Aug 2022 15:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ED0983F09
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83ACBC0033;
	Fri,  5 Aug 2022 15:37:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A369C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 15:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69FB860E85
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 15:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69FB860E85
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Wh4+prLA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFrYShil7v1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 15:37:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D864160B12
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D864160B12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 15:37:02 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id a8so3075087pjg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Aug 2022 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=FWkeNcL7xrNhKXm5tviXEub3CTo30zaz6QEhKgmLfno=;
 b=Wh4+prLAHHxtNt/IbJ+VyVqSm51adZ+EQvj6oPpvL1HZx51SroKApi7e692Ai9xh7d
 UVFYN1K85A6F6fEBraTZiwGZg7Wf1Wgui9y5U5sJy32U0lQJXRcllVWOt4aAWvD8H8AU
 VPWRRMnPNAsF//amIq1ynUm/5WKv/iBq9FS/Vx/nEQgiA6Y5LUJBbOPjcPceZlF5+Crs
 PaUqqziU5KyasVugbinDG/s559SOjJ/zegoGeL8wVKkH6Y0lgx+WTr13BrI9xhn4znzw
 3D4RTKEJfVNCzoxkS4SwmDMyqEYMBrakZ+SuCNZCJo9nu96E2YU5QzB8A48aX3arTI/G
 nwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FWkeNcL7xrNhKXm5tviXEub3CTo30zaz6QEhKgmLfno=;
 b=AmTWJQOxwybXr+Re66zzudZ2z/a87swh70EFbpwBzUwWWYxwXCL02/cPXM8dlFKOp3
 qPgCMX/6GhisSuZBKo556oMdOPIaDT/zPK+/dxxklHx9+fMg0ND60AdcckuLBa2e8uGQ
 2KUYnNkRkZSfx7N0XgwHp28NAdCuNw4ACgnShExoZzMrf+UWqLGsMGWFb2UlvcH2LlBp
 9Q79iVXwjGSeyfRuEynOYKg/Y889iU5VdbTdsSNdTKmNikQMDO/4MI/GHOoZf6TVc1yC
 /3OMbDmyw00Rcj/EbiTnWxbjA0zOOQJybbVtSd3r4nkysASQjGcUhfmRD1prrVkGKOiy
 Y0rQ==
X-Gm-Message-State: ACgBeo28VL1SBA+LxaaAJb7K0gafmaxmdXhvmOe1/v36D8jVvDDSrBcH
 +xi3qaLBL8+Ws2HqQO3LGeu1b5XhopxCu1yA3VY=
X-Google-Smtp-Source: AA6agR69dts3gAGzr+osUP0+5TQ+fEbmA58vIEk4l2cPf9kpp1RApid3VkpS2EvXRQ4llJPXl5aAleIP6og7HfU2WTc=
X-Received: by 2002:a17:902:ce0e:b0:16c:7977:9d74 with SMTP id
 k14-20020a170902ce0e00b0016c79779d74mr7518939plg.92.1659713822191; Fri, 05
 Aug 2022 08:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000026328205e08cdbeb@google.com>
 <cover.1659676823.git.yin31149@gmail.com>
 <87fsib9e3y.fsf@cloudflare.com>
In-Reply-To: <87fsib9e3y.fsf@cloudflare.com>
From: Hawkins Jiawei <yin31149@gmail.com>
Date: Fri, 5 Aug 2022 23:36:50 +0800
Message-ID: <CAKrof1PcSg8PfwwG92qOsp=3sEHE4mTnb4fBtcCw60Mv9gp5zA@mail.gmail.com>
Subject: Re: [PATCH net v5 0/2] net: enhancements to sk_user_data field
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, paskripkin@gmail.com,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Fri, 5 Aug 2022 at 18:30, Jakub Sitnicki <jakub@cloudflare.com> wrote:
>
> Thank you for the fix.
>
> For the series:
>
> Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
Thanks for your patience, it really helps me a lot!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
