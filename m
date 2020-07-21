Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6650AC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 13:01:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B492073A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 13:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxrIxIJL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B492073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 111DC886B7;
	Tue, 21 Jul 2020 13:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9wjZO-hS1tg; Tue, 21 Jul 2020 13:01:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE65982F92;
	Tue, 21 Jul 2020 13:01:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCF52C089F;
	Tue, 21 Jul 2020 13:01:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBC09C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 13:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E37D786F22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 13:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OM_6WSv-mJZU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 13:01:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 830A286F1B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 13:01:29 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a24so10690196pfc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PVh0UoUWYQd3T8847SakLzIV/J/J6Lx8vEgfKUN35n8=;
 b=nxrIxIJL7rLwgkY3my8Zt5Gh6rDni7leFzWeeRl49CaLT3Q16M1gfCAyFIuvUB5+P6
 CkhIbVIkXULhjDyR0hGf0OMmAPYQkm378GoxFIFgJDQ1G7SBT4buLfGjZKBwcur/s+i4
 qFx3VdWwtOJRO2UyVR7A3nWAbY9NjKMy3KWaBXk/+h+ZqfIXl2uAPv7QbqVRyd7hEMdy
 1bK/5L1jOc3clwuLhMW66CWuwjCdUPXuSz11/F3WTfIx3dSZO2kzBZLVovAFsJOpMk0L
 y5p6ceMbMGCGlUM01uqvsPymyPZ3c2+5QEbflevWos0nHDWw3xXXBi9aYk5qAabvhOD/
 TKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PVh0UoUWYQd3T8847SakLzIV/J/J6Lx8vEgfKUN35n8=;
 b=ZqHOPANhYQZVhvUR6gATy6YhhWFdIPS/Bmj5R3j+BXxXoKWYU3aLoT3Dog+1lgElLQ
 ubhVUR1fUb01HTos+o2U7r0DCwI8ldmell886WQoAlDBGZ2o5CHH/Tnacss+fbhiGEqK
 IKOLiEkE82comji9fsiRkNN7ll0zJAF/HZwMrpxP7xBec7nrP0fEv+15JY9mk2L28/1r
 UgDjfatGdHHDkd54WIxISxx/zdbIxL0iK+ufj3SzM2Y9Ibq4wVVkvqs4bvGqkkEA6ZJJ
 5maHdjO63Cftit+3fTcs1N7Y25mNyWoORyBiHi0BT/a1q7dTrDoE0DjV+wk3r88TWaPC
 FnPg==
X-Gm-Message-State: AOAM530RSv98zdPGvQ4hciaAqPTFJC0IfpgiW3v4LGWuK6ITuEx5Goq9
 GJ/ZfkPrsbKLvrqRHtornhI=
X-Google-Smtp-Source: ABdhPJxzhb9UFg9JQyfO5NooNCWTMMytOO3dNVT0hez4mbKmugYBPNC2GIL8p9+BcoskQXbhEmNsJg==
X-Received: by 2002:a63:1a0c:: with SMTP id a12mr22295348pga.24.1595336489026; 
 Tue, 21 Jul 2020 06:01:29 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id w29sm20191981pfq.128.2020.07.21.06.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 06:01:28 -0700 (PDT)
Date: Tue, 21 Jul 2020 18:30:07 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>
Message-ID: <20200721130007.GA145812@gmail.com>
References: <20200721125514.145607-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721125514.145607-1-vaibhavgupta40@gmail.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] prism54: islpci_hotplug: use
	generic power management
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

This Patch is Compile-tested only.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
