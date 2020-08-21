Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E72C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 10:26:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35956207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 10:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tZUcqQk4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35956207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ECD3F885DF;
	Fri, 21 Aug 2020 10:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOPHYNWr30CW; Fri, 21 Aug 2020 10:26:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E58688556;
	Fri, 21 Aug 2020 10:26:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 224DBC07FF;
	Fri, 21 Aug 2020 10:26:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CCBBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 10:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4285E883A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 10:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qalee9mLN7D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 10:26:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A404B88362
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 10:26:24 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id j13so631328pjd.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EDYP1Th9SUcoctkxgo3VQaPnbnmkI7OqEYMxoTvtHN0=;
 b=tZUcqQk4OxfAKx4yXlUjLq+S42J/dpi6hvKmcCzI7IOMFgXO22q8ZpOubAhZVhTkWT
 aSQmB1e0K2G2oiTgh0Jvi76L758pJSsbReHvXNc7DWEnXicLnC/wYxrJRkb1Z73wXQ2a
 vtnv+OsXzqtK3iUEduj5O+B1sA6VgK8M3/U4QvtO37i8XbtUzYVQKweCEFkQpPfDCosT
 vOpOpxUE8hwCgsOoFilXxhA7Ou47ncykW0t4gif9aGMl9TnGYIKCguP681X0e5iAbae9
 w68BzZm9t69S75hyC++oITJJAH952IURlQQ4wntJnTU1m1mj2qGH7nV4TBx6IYlkInP4
 viOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EDYP1Th9SUcoctkxgo3VQaPnbnmkI7OqEYMxoTvtHN0=;
 b=KITJohWpFOdl+M7WJCdRzfq+gR7eHm7SFKEB7wkekbPlNTY2DOZihM2Ti6rv8odPJt
 NbD/3SZL9NnIGDaYiWnTBhsjftmXqY9eUW0hKSXNhkKW70gqOgU/3jSwz+V+2Q4p03J+
 1TD7H3myXIYE8nTWJvpOFyZOWW2POzAGGKnbwcmufDR3ZAu88/kEzyslW0hUP6P7/P7b
 NbPcW6B8qZ+f5Ec6yUoF/hvM0E+6h5j0ZHVYChijZ+F2VI7Tkg6/1nbtZ6v+AdraDGjs
 8M6C7ZhSPSxv8GMuPdC5fv/VwR5LQSOBWv/6cwoPRPbABGTkdmMM9sHU+aZp5E3089TE
 +d2g==
X-Gm-Message-State: AOAM533j4G9jgUAzBQRjC4SHXiPwI6TOde9s1t763hGlIaCrTEwSG/QH
 IExV0GTF7AbNch7dw7hvRQ==
X-Google-Smtp-Source: ABdhPJz9R9MwaPyIag3S3tRWpw9WvpKuu1aTtQc6U/Q6abAmmcfdC12JeVCjoNu3HX8Bp2NmCvYGXA==
X-Received: by 2002:a17:902:a412:: with SMTP id
 p18mr1756333plq.283.1598005584196; 
 Fri, 21 Aug 2020 03:26:24 -0700 (PDT)
Received: from PWN ([2600:3c01::f03c:91ff:fe6e:64cd])
 by smtp.gmail.com with ESMTPSA id v11sm1634230pgs.22.2020.08.21.03.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:26:23 -0700 (PDT)
Date: Fri, 21 Aug 2020 06:26:14 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <20200821102614.GA490417@PWN>
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
 <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
 <20200821094813.GB480216@PWN>
 <eab860f3-5520-72cd-3bb1-f990f7f9ea6f@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eab860f3-5520-72cd-3bb1-f990f7f9ea6f@xs4all.nl>
Cc: syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix
 global-out-of-bounds read in precalculate_color()
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

On Fri, Aug 21, 2020 at 12:12:28PM +0200, Hans Verkuil wrote:
> Arrgh! I know what this is. /dev/video6 corresponds to the Metadata output
> device of vivid, and that metadata format sets brightness, contrast,
> saturation and hue:
> 
> struct vivid_meta_out_buf {
>         u16     brightness;
>         u16     contrast;
>         u16     saturation;
>         s16     hue;
> };
> 
> vivid_meta_out_process() calls tpg_s_* functions to set these values. But
> this is wrong, it should set the corresponding V4L2 controls instead since
> calling these tpg_s_* functions bypasses all range checks. It also will
> not update the controls themselves, so they are out-of-sync with the actual
> values. I.e. the test pattern generator uses different values compared to
> the values in the controls.
> 
> So two patches are needed:
> 
> 1) a patch for include/media/tpg/v4l2-tpg.h where tpg_s_hue will clamp the
> hue value to the valid range. This to prevent anyone else from setting invalid
> hue values in the tpg.
> 
> 2) a patch for drivers/media/test-drivers/vivid/vivid-meta-out.c where,
> instead of calling the tpg_s_* functions in vivid_meta_out_process(), it
> calls instead:
> 
>         v4l2_ctrl_s_ctrl(dev->brightness, meta->brightness);
>         v4l2_ctrl_s_ctrl(dev->contrast, meta->contrast);
> 	etc.
> 
> Do patch 2 first and test with syzkaller to check that by going through the
> controls this issue is resolved. Since with that approach the tpg should
> always get valid hue values.

Ah, now it all makes sense! Thank you! I will do them now.

Peilin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
