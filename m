Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9F0C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 18:43:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E3F20709
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 18:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NzL8+jxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9E3F20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6194387006;
	Sat,  3 Oct 2020 18:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4z7F4TqoG-L6; Sat,  3 Oct 2020 18:43:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3327287188;
	Sat,  3 Oct 2020 18:43:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03ADFC1AD6;
	Sat,  3 Oct 2020 18:43:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 279DBC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 18:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0DC57867F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 18:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkhW+CBvs6lM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 18:43:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 08B66867F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 18:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601750601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HWM0RfrM0HZAs25gIGx3NLfFo36RAwB9ram8EBWXtH0=;
 b=NzL8+jxeAT74Xoye5npss0OvEUdXZQIqDGyUesVHTbcMOakxAgGGW0EhLyybungMtHp5r9
 n9aO2gLq03wr+xNYAtifB7yTHUJFgmCtRiL94hZqJOldVnZMFhIg0NIys/VRfJKKkGhCcA
 2urgq237/GVFZlc/1+JvIyldM5ZApXw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-hLTCvZnmNSO92BaOYngdCA-1; Sat, 03 Oct 2020 14:43:19 -0400
X-MC-Unique: hLTCvZnmNSO92BaOYngdCA-1
Received: by mail-wr1-f72.google.com with SMTP id l9so2044001wrq.20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 11:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HWM0RfrM0HZAs25gIGx3NLfFo36RAwB9ram8EBWXtH0=;
 b=YzfoPFnQxPQlbtbo03Uoe2bI3e85o3ESc2Z/EpU3HyAclZjZP3FAX4m/jxKCHKWKae
 IBvd56gMg6sIUggG6jFJQZat7DPxC+Lf+pZ60vtwfsLOJDS5fW0GGQfFsIx7p33Qakmp
 8hCfUgO9vOMeK2xzxqNjZy8rocdgwgWygcExW5Xp0e2gWWVYbOWniugldkxUVJWKLyt1
 oMQr63zxPgdFJa10HVZZSyypZZF6u2SEXcarpQXi12Z5a770PfB0g4U5y7FkkT4HWgO9
 6j9/BhZWKfx3kQsESAKY124ej9O+wU1G8oJ96XslQKi6ITiOlm1cJFQ5jbBbQ3uw+LVE
 vmrw==
X-Gm-Message-State: AOAM533fIXZPHlm2BMZ1GmcD73SRZiFT8nEShHOafUqag/JsiKYup6y9
 WM9WUPGAFC9V9rKfm41PG9q9d8gZbVsIZwSZps703mvFwBwS1+1B0+5cMgAC9tcNVY6zhcQqLVa
 04zKIC33Ze5Llmxlryv/Ad8akIr+6U+rGHrZ89RZnk/rKoKLP
X-Received: by 2002:adf:e852:: with SMTP id d18mr9744698wrn.40.1601750598390; 
 Sat, 03 Oct 2020 11:43:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy038Yccnpob9//W8sOr1lm3wbsl6dgaQoAhcFw98vUjFVu1T3n44Gs2WlgxSmLiPyyNgs9bw==
X-Received: by 2002:adf:e852:: with SMTP id d18mr9744690wrn.40.1601750598224; 
 Sat, 03 Oct 2020 11:43:18 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id z127sm6091271wmc.2.2020.10.03.11.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 11:43:17 -0700 (PDT)
Date: Sat, 3 Oct 2020 14:43:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20201003144300-mutt-send-email-mst@kernel.org>
References: <20200930051722.389587-1-anant.thazhemadam@gmail.com>
 <20201002.190638.1090456279017490485.davem@davemloft.net>
MIME-Version: 1.0
In-Reply-To: <20201002.190638.1090456279017490485.davem@davemloft.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: anant.thazhemadam@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, jasowang@redhat.com, john.fastabend@gmail.com,
 ast@kernel.org, virtualization@lists.linux-foundation.org, kuba@kernel.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/2] reorder members of
 structures in virtio_net for optimization
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

On Fri, Oct 02, 2020 at 07:06:38PM -0700, David Miller wrote:
> From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> Date: Wed, 30 Sep 2020 10:47:20 +0530
> 
> > The structures virtnet_info and receive_queue have byte holes in 
> > middle, and their members could do with some rearranging 
> > (order-of-declaration wise) in order to overcome this.
> > 
> > Rearranging the members helps in:
> >   * elimination the byte holes in the middle of the structures
> >   * reduce the size of the structure (virtnet_info)
> >   * have more members stored in one cache line (as opposed to 
> >     unnecessarily crossing the cacheline boundary and spanning
> >     different cachelines)
> > 
> > The analysis was performed using pahole.
> > 
> > These patches may be applied in any order.
> 
> What effects do these changes have on performance?
> 
> The cache locality for various TX and RX paths could be effected.
> 
> I'm not applying these patches without some data on the performance
> impact.
> 
> Thank you.

Agree wholeheartedly.

-- 
MST

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
