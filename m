Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09424C7EE23
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 May 2023 16:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E6CB404DB;
	Fri, 12 May 2023 16:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E6CB404DB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DOCSZD3R
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_QFoPPtNWZZ; Fri, 12 May 2023 16:40:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 89A4241665;
	Fri, 12 May 2023 16:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89A4241665
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 628BCC0037;
	Fri, 12 May 2023 16:40:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F89DC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 16:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4239541800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 16:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4239541800
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DOCSZD3R
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjRT8pmr0Rvz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 16:40:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3AE5417E4
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3AE5417E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 16:40:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so59735465e9.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 May 2023 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683909606; x=1686501606;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOPr8RiZNSgqggpmzVuoRlbviV7C/s+3BUUqAAb6inU=;
 b=DOCSZD3R4gA0NV+uJmIYMvCPKGm8d9kpASOgAAz+Pf4S+bC0zfZIpDVA6j4pA5/G9z
 2pv/aZk9u0O0KFrGIRGMFN5sxS4S/44ucOrDp+w9VpWR4uuZvwDTzUhBQBhBZ8S1Tz3B
 A5RVjIX26Ua+r+QGuGgXEYRPOaEK2M0bQL6s3XxHIXuZRKLWM+xfN3SpYRT0P92uopQt
 CkJRyCOBuJ4vl5d6ZVUxN/FPuTayqcbUDbcbnkY8KA6iyaI8vGfTnKQJuxTpkgX780tb
 2n2REXdeuXT4AOACppzPbHWgY1hFyp1P5fqnXt0Bz0wOeGEDCNuAqXOkQ+hG5w5ExObO
 OR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683909606; x=1686501606;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gOPr8RiZNSgqggpmzVuoRlbviV7C/s+3BUUqAAb6inU=;
 b=IAq3Zr7YSxYaeaQ4C8RTAnrGzRxroII6ARvmbvxiL3HUMEFwFXNw0bH16mARfI312l
 +czJuaRDKz5kDQGllPlYtweeH8JYtXK0jb2zvK/s1vIIkOlK/XOGqgbtSjgaP99kMWG9
 wESzga1J07vm035382Q6GyNFO0SO3nuVYhWDWp4tfzX40lfNkPO/WgSp47T94zQdWj+/
 bYtEx8p6X4/MaEeOS0TDkAWqlTJon8lkxSxhBKTB78GyFCw8AdYpyy9KVbiIisBTunc4
 9PknvPXyOQ65VSyUwyqz1I+pv3cl6tiiCl90JedO0Uq8yFHVF6SNgSn4GMhuOSjpGkYV
 LZKg==
X-Gm-Message-State: AC+VfDwFLW+HpjLdHIC3iS4LQfp/BdID67vV8FgU0UUPeq9tDMJULkS5
 Vzg8+vcXeSdNrD6ed4mHmpk=
X-Google-Smtp-Source: ACHHUZ5yxbWW2Bv6DZDq5gkRtNdoEDpV2I3JPwHvYv23gd+IPRTMx71bA/LG2dz5CkgOQTwYpkRxhA==
X-Received: by 2002:a5d:5968:0:b0:2c9:e585:84b0 with SMTP id
 e40-20020a5d5968000000b002c9e58584b0mr16128939wri.1.1683909605667; 
 Fri, 12 May 2023 09:40:05 -0700 (PDT)
Received: from localhost ([146.70.133.78]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c214d00b003f42461ac75sm16140195wml.12.2023.05.12.09.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 09:40:05 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 12 May 2023 18:40:03 +0200
Message-Id: <CSKG4WDA4MVH.1RVYIN4NYH4EA@vincent-arch>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Bjorn Helgaas" <helgaas@kernel.org>
X-Mailer: aerc 0.15.1
References: <20230509153912.515218-1-vincenzopalazzodev@gmail.com>
 <20230509211902.GA1270901@bhelgaas>
In-Reply-To: <20230509211902.GA1270901@bhelgaas>
Cc: kw@linux.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

>
> Thanks for raising this issue.  Let's see what we can do to address
> it.
>
> On Tue, May 09, 2023 at 05:39:12PM +0200, Vincenzo Palazzo wrote:
> > Add a configurable delay to the Rockchip PCIe driver to address
> > crashes that occur on some old devices, such as the Pine64 RockPro64.
> > 
> > This issue is affecting the ARM community, but there is no
> > upstream solution for it yet.
>
> It sounds like this happens with several endpoints, right?  And I
> assume the endpoints work fine in other non-Rockchip systems?  If
> that's the case, my guess is the problem is with the Rockchip host
> controller and how it's initialized, not with the endpoints.
>
> The only delays and timeouts I see in the driver now are in
> rockchip_pcie_host_init_port(), where it waits for link training to
> complete.  I assume the link training did completely successfully
> since you don't mention either a gen1 or gen2 timeout (although the
> gen2 message is a dev_dbg() that normally wouldn't go to the console).
>
> I don't know that the spec contains a retrain timeout value.  Several
> other drivers use 1 second, while rockchip uses 500ms (for example,
> see LINK_RETRAIN_TIMEOUT and LINK_UP_TIMEOUT).
>
> I think we need to understand the issue better before adding a DT
> property and a module parameter.  Those are hard for users to deal
> with.  If we can figure out a value that works for everybody, it would
> be better to just hard-code it in the driver and use that all the
> time.
>
> A few minor style/formatting comments below just for future reference:

Due the recent email I think it is worth make a version 2 of this
patch with your suggestion? and iterate over it another time?

Cheers!

Vincent.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
