Return-Path: <SRS0=1dzN=BN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FAAC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 22:39:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EAE32068F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 22:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG4ZErxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EAE32068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25D5885F59;
	Mon,  3 Aug 2020 22:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOuMvwfcO1wv; Mon,  3 Aug 2020 22:39:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C829B85F19;
	Mon,  3 Aug 2020 22:39:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1CB1C0050;
	Mon,  3 Aug 2020 22:39:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2034CC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 22:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0F38585F59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 22:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBx2AzB44aVB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 22:39:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7247185F19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 22:39:47 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id b79so36694561qkg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 03 Aug 2020 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qq/OoGqAWgSNxLVy8asfjdh45pV617fREiK/m3ZEZvc=;
 b=QG4ZErxqYyI5iREiUFB1jMDEgaclsLXRd3qwNHgPxJzT+aVI+210+43VgEexTxw6IX
 y74sgnsPzSLxLnp0of6tip9TkJMrGZTLca4BZPcGmV4QSuxBHbQ8KuZD2HKe2n/FwK0d
 yiyFxmA6bZvuGva3RjPOo+IQtbABTApfwxzEa5UTTNDvgkxhj6+iH2Vtw39VhLRndJr+
 vuCoE9wIGSE6oGCunTqahhgLIg/m77qW/XGZQv0yV7j4hrkv207z9NIYQkz6McOWqQzV
 mORR1fIYynddz6vh2HAmDPzlVdz6aEpFFt2K8j589b00+45j5QZ9vWmK2swulkUEe5cO
 f1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qq/OoGqAWgSNxLVy8asfjdh45pV617fREiK/m3ZEZvc=;
 b=HFJEtQeHx+l72IY8kkCzxq19Pg6pk+RjNAWToHQMu0bHtziyFGmbCSzSNAd41yMtR/
 Doy/jq3JEJB0fidPdLPxoN5MOuWbXKYyLIWD3eQC3FttzN5qMljvDnj8dhhgW0wJd+3Q
 jR+MNvH48yvRG0O7a7Vnl/lRyPxMJOpK0at/BoUcqqxSLt8Naopxfcmu6FoaWxarfLQh
 lRxmxtGrNZG18J3Dmm8rTfoLPlyWLKldg9AUS3hBIxOt8njiySkutmrCNgul6Kqw4fko
 v3GnB37BrAZIMQl38PkpnQKl4NIRDHTJLoXLJOeS2jrwEPAsJcoh/h7Upvuf/Er0O+GR
 /9hQ==
X-Gm-Message-State: AOAM531fw1tvsNwxlAkoitFWQlEFKrLa6ANJSsdtgBzK6A26sETczcrI
 XWK2DGXQdQ70HigzIYBg5Q==
X-Google-Smtp-Source: ABdhPJw+GsNsQWRmU7MC/kx5uUzqsIy4eLp6XbvQecrcAmCCTD9dKtBc1b16dqlFsVR4Ob1pT8i7xQ==
X-Received: by 2002:a37:8047:: with SMTP id b68mr17229339qkd.299.1596494386464; 
 Mon, 03 Aug 2020 15:39:46 -0700 (PDT)
Received: from PWN
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id u37sm24292165qtj.47.2020.08.03.15.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 15:39:46 -0700 (PDT)
Date: Mon, 3 Aug 2020 18:39:43 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20200803223943.GA279188@PWN>
References: <20200731044838.213975-1-yepeilin.cs@gmail.com>
 <20200803.151038.440269686968773655.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803.151038.440269686968773655.davem@davemloft.net>
Cc: dev@openvswitch.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 pshelar@ovn.org, netdev@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, dan.carpenter@oracle.com
Subject: Re: [Linux-kernel-mentees] [PATCH net] openvswitch: Prevent
 kernel-infoleak in ovs_ct_put_key()
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

On Mon, Aug 03, 2020 at 03:10:38PM -0700, David Miller wrote:
> From: Peilin Ye <yepeilin.cs@gmail.com>
> Date: Fri, 31 Jul 2020 00:48:38 -0400
> 
> > ovs_ct_put_key() is potentially copying uninitialized kernel stack memory
> > into socket buffers, since the compiler may leave a 3-byte hole at the end
> > of `struct ovs_key_ct_tuple_ipv4` and `struct ovs_key_ct_tuple_ipv6`. Fix
> > it by initializing `orig` with memset().
> > 
> > Cc: stable@vger.kernel.org
> 
> Please don't CC: stable for networking fixes.

Sorry, I didn't know about that.

> > Fixes: 9dd7f8907c37 ("openvswitch: Add original direction conntrack tuple to sw_flow_key.")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Applied and queued up for -stable, thank you.

Thank you for reviewing the patch!

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
