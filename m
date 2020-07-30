Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07891C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 10:23:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0B52082E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 10:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgqlNcWC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE0B52082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3116869D2;
	Thu, 30 Jul 2020 10:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKFyAMWioJa3; Thu, 30 Jul 2020 10:23:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D7AB849D2;
	Thu, 30 Jul 2020 10:23:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26B5CC0050;
	Thu, 30 Jul 2020 10:23:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62D08C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 10:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4E8B6869C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 10:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJvqJzddcVkG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 10:23:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0A523869A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 10:23:27 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id c6so3779737pje.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 03:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1TfTR8Lp7hRKQ+lCxjn1lE5hq4Qzl/G7eGSS/NXpthA=;
 b=SgqlNcWCpJUaLfLBwM02ixJFhCj4xCMvydh2bBlK+bU/6gsSrxVBlDeQqW3sdpjcpS
 ql2RfXZF+/z5wYVZ/ajCmbuaaYFwlDRoMtZsfGOq3ojCNjBipuSwC7sM6Sj3sCmgibUy
 6BA1LRisHrKgr+FDYaXgEvwAWX/59rj6nrI4DMNiJUwnbpIkbnwIUuhGUy1YWZOSTkbS
 FOEeO5IMRy4z9Hlf2JoxUR9CVT+A55JjHX/Oyc33st0X9JSzbbb6+JGByea1m2/gSgm7
 GEdwEooCZDqwu105hUNFFh5ZydPXtdoPyVxaHrr8C+PY5wnMAxmbX09kBmVoO7Edp0oa
 fH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1TfTR8Lp7hRKQ+lCxjn1lE5hq4Qzl/G7eGSS/NXpthA=;
 b=Qbtk2utfCVfZD4f2Hc6TNj+G0Iio5aB+fnjFHhWRnFspQq/0gLVMaN4ISl5yAj/Fle
 gKJLjgz39o/XpZ9VbVIRxXTibpQ5qtLzI037jzceRUwpFEsVcGe9tnof9eqdbHAiag5U
 w/O9ncM3Vgjdy2rusHNjTY90PsN6VSYJqFuyPhIWsZpeYdI6/FLOT3CVIA3CG1RbmFi6
 4MNeLH03BGxq3GZ3keLn28P63XTwu9IYKEWUMSbnLjoLe5FKEwVNUW23TPjWt0z+p3sJ
 +1WT67jb+UunsYoni9CLpFBeoXFgzuqg6YOzWmeWWtuKijTilR0Z1CbFeHzxrkEGV/Ko
 a7kQ==
X-Gm-Message-State: AOAM530/vXQi8LYLg+d+T3zJYy8osufZ8+aBUxlDRLNEtzZO+0KI4kfi
 xS8ULGBMDa8Xeb5uoc6FXqI=
X-Google-Smtp-Source: ABdhPJwtUE3R0FEcG2no1f+PaKbEvfyDitIH4cyALH9m+3bRtaBL1KTwLLao4m/kkUElXedWB7iaRQ==
X-Received: by 2002:aa7:91cd:: with SMTP id z13mr2664104pfa.133.1596104605709; 
 Thu, 30 Jul 2020 03:23:25 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t28sm2507739pgn.81.2020.07.30.03.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 03:23:25 -0700 (PDT)
Date: Thu, 30 Jul 2020 15:51:59 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20200730102159.GA595053@gmail.com>
References: <20200730101658.576205-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730101658.576205-1-vaibhavgupta40@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] scsi: stex: use generic power
	management
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

The patch is compile-tested only.

Thanks
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
