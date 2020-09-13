Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5719C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 07:49:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565E0208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 07:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2JxUspO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 565E0208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0640C86B7D;
	Sun, 13 Sep 2020 07:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tokWOq+g8maJ; Sun, 13 Sep 2020 07:49:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B9B786B52;
	Sun, 13 Sep 2020 07:49:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EF95C0052;
	Sun, 13 Sep 2020 07:49:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78196C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 07:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6A91386B7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqj3liiK3j-x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 07:49:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CE73D86B52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 07:49:35 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t6so1686857plz.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qYWzNSDa14AkONpbTTLew5leaH4VXQTqzaEvTUMECKw=;
 b=W2JxUspOxdm0NdXZ7vuXab7dorsL2Sg17rUePYjKC2jnCwKuKF+g0y1vMMFbTrCoA9
 Xl39Q8kyYLehH7wicKKkYhr8rfHlpYqUEHVaosiAzZLmoier6jxBcb6YSlUmYclTegUG
 +guaLxL/6oEVPr4dIcNW2hmyngJcVBn66iu+AWQjspCB1p0DLDe0NIDCU9fKdc0i++PL
 pCG0EYRjRu3GkUKjMnWPDme+xqMRidS6vnvk5wqOXStRF9exEgJVrqhC2PnlLshSVIO6
 ufPaXTwJW44MPjHkhesGk61Edw9kIe2xTTqYekoW85OJTJx0ipxTHmCW7ycmY2GpQfUr
 MV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qYWzNSDa14AkONpbTTLew5leaH4VXQTqzaEvTUMECKw=;
 b=tqGJbYzYb3roSC9DE1GqToZALK4vYE3UziBjwpuMZKEgUFRiE3coW907Fgl7LKafiJ
 VLkyOh5cooLgqdDnsRq6vqkyJAEHhveGbLByE/IOSJdT/b8q3RDvMd9HmNsclDZKnkP7
 PAjttcVPGKr/tQ5PHNr7DgtYhVOO+Jax8aSoKUeqHS7a2D1QLyWQ6cTXbFQvIEUOUGDC
 IAv6JEXFHRdILBE3hhXScu7Qo7NWFmZRjME8FehTIDPGFUe6vi14If03kycDBXFE0ajb
 hJT+4jj/3iOUZsrS2VGQacbSZxNXtsm7UhVkZBXZOX9C9E2bIOmzrqoGgV+o3so1Ifpd
 MSPQ==
X-Gm-Message-State: AOAM531krr8wHL6Da6+q4lhPPsgQ8qoQhvjJCerT87Q0Z8qEL9Tl0PXl
 xeVGj+euH5bgZuYkXV5Paw==
X-Google-Smtp-Source: ABdhPJwMctwccCvazig0Cn3qhtL8QflPk2h8eWljuT5ukI9082bAYzzDMWgC6b1Mb9SoIsvbMBTOCA==
X-Received: by 2002:a17:902:c692:b029:d0:90a3:24f4 with SMTP id
 r18-20020a170902c692b02900d090a324f4mr9256031plx.12.1599983375416; 
 Sun, 13 Sep 2020 00:49:35 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id s8sm632246pjm.7.2020.09.13.00.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 00:49:34 -0700 (PDT)
Date: Sun, 13 Sep 2020 03:49:23 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20200913074923.GA1533160@PWN>
References: <000000000000879057058f193fb5@google.com>
 <20200912102230.1529402-1-yepeilin.cs@gmail.com>
 <20200912.182336.585362420502143240.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200912.182336.585362420502143240.davem@davemloft.net>
Cc: hdanton@sina.com, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, jmaloy@redhat.com,
 tipc-discussion@lists.sourceforge.net, ying.xue@windriver.com, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH net] tipc: Fix memory leak in
 tipc_group_create_member()
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

On Sat, Sep 12, 2020 at 06:23:36PM -0700, David Miller wrote:
> From: Peilin Ye <yepeilin.cs@gmail.com>
> Date: Sat, 12 Sep 2020 06:22:30 -0400
> 
> > @@ -291,10 +291,11 @@ static void tipc_group_add_to_tree(struct tipc_group *grp,
> >  		else if (key > nkey)
> >  			n = &(*n)->rb_right;
> >  		else
> > -			return;
> > +			return -1;
> 
> Use a real error code like "-EEXIST", thank you.

Ah, I'll fix it in v2 soon, sorry about that. I saw another function in
this file returning -1.

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
