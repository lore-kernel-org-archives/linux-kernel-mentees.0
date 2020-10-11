Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17801C43467
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:14:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA5D2222A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+BQcBWl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EA5D2222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1930C85D7D;
	Sun, 11 Oct 2020 18:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Erh_PnTtOd3i; Sun, 11 Oct 2020 18:14:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 14A5385C19;
	Sun, 11 Oct 2020 18:14:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09E32C0052;
	Sun, 11 Oct 2020 18:14:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98267C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 875DA85D7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuyK0n_edBJ5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:14:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D1C3785C19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:14:37 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id o3so1818485pgr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 11:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UowWsmXleYzuxEdUZhIHh/lbC1bevW2tfb9Za6sH6aM=;
 b=G+BQcBWlE1epJkNcsrrrtHaaDK1zqxmeJu2AOrpMsrLzWl2RgjDTemfIN2Nestk47+
 pIUuiiDWTFIegFXywSkYorchoUN3MQ+y+UyexS+CX8dPU45CGagAVTi8Fov+zSDDFqIz
 tQR3+L0NSFYYgvKevozV6JKaMCLNfugGBW6PoGmYAmWjducq68qSi/JrUn4LZjOrJplm
 km5BQFCo+kl3kIZMJBGZaudP2yCOAnXWEKaGHxaO38KF1kqiEN96cpRzGKPv2OFyHwzc
 gIhx79EOKI9O3kgcNx/avOW6wjvJbQKuUqtPtf/fsbSD9KRIPbz++hGxBVK1h/vmArTH
 3XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UowWsmXleYzuxEdUZhIHh/lbC1bevW2tfb9Za6sH6aM=;
 b=Jtu2680Rk/Lj3nw2MDeTpvaNtqcci2OQ3Hi5TN+4wvg4HnDsUsycrB6Pk9PpVsbRiU
 gUBu/k49N+GEIpBykvSnPoI4N3HS4PBXStYqQY+bYHJjXvZqNqEOWjqluKAg5TbEks4o
 BcTJtiK4HepmEzlOOXrKSKUJM6QhBGOhvp2NawcnLnZWNocA1GwFc3CXY1iwb2Ag5rqw
 ws1R7oEjyiEUhxGd1Jb/bO5hsUlNlMvNz2e2Bskrb+DK66ic9rrSK/qJhj216GaQKEab
 YjJszL6TwG+F20Db9Xn7wwpBvF/iPpn0QpVYBtPubJGoHXkTW4HTYO4FE2P4ftzjBlgJ
 bdRQ==
X-Gm-Message-State: AOAM531AAtlvDTZKc7N74Hi6eqqykuASbP4kwh12QwhPxPXRXMmq92rA
 MKlqEeu6mDvnbQuKG64ObBCB4VFZOlvgKw==
X-Google-Smtp-Source: ABdhPJx/OgjLLVhFqZfXDwi7NkWBZF/uDN23TUVF9opMvmRerHBUfxSd1BOLshP4utZX8XMswviSXQ==
X-Received: by 2002:a17:90b:412:: with SMTP id
 v18mr16390718pjz.216.1602440076874; 
 Sun, 11 Oct 2020 11:14:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id y126sm16664267pgb.40.2020.10.11.11.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2020 11:14:36 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010111946390.5535@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <28381616-fb42-4efa-7a5a-7127e1a3f794@gmail.com>
Date: Sun, 11 Oct 2020 23:44:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010111946390.5535@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On 11/10/20 11:20 pm, Lukas Bulwahn wrote:
> 
> 
> On Sun, 11 Oct 2020, Ujjwal Kumar wrote:
> 
>> checkpatch script checks for invalid EXECUTE_PERMISSIONS on source
>> files. The script leverages filename extensions and its path in
>> the repository to decide whether to allow execute permissions on
>> the file or not.
>>
>> Based on current check conditions, a perl script file without
>> '.pl' extension in its filename and not belonging to 'scripts/'
>> directory is reported as ERROR which is a false-positive.
>>
>> The script can correctly handle patches with mode changes and
>> shebang line if shebang is taken into account. So, along with
>> the current check conditions, adding the shebang check in the
>> check conditions can improve the reports of the script.
>>
> 
> I think one of the core design decisions of checkpatch.pl is:
> 
> checkpatch.pl can run on a patch, even if the patch does not apply to the 
> current repository version that is checked out.

From our past conversation I remember about this particular point.

> 
> It solely uses the information in the patch, and does not try to guess how 
> it could be applied etc.

I am fetching the 'shebang' from the patch itself (therefore I do not 
understand how does the proposed change violate that design decision?).

> 
> This patch violates that core design decisions.

Can you please point out the exact change that violates the design decisions?

> 
> You can propose to Joe Perches and lkml, but do not be surprised if that 
> is rejected because of this reason above.
> 
> I would be interested in the discussion.
> 
> Lukas
> 
>  

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
