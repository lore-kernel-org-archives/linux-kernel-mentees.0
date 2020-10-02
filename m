Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F1DC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 18:02:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7508E206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 18:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="S3g768h/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7508E206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D66E868D3;
	Fri,  2 Oct 2020 18:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWIpcGsGS9nC; Fri,  2 Oct 2020 18:02:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5881F868C5;
	Fri,  2 Oct 2020 18:02:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F05CC0889;
	Fri,  2 Oct 2020 18:02:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A35A4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 18:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B78F87393
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 18:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q70pH+JWBa26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 18:02:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 949B8872EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 18:02:05 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id y74so2455861iof.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h8V5q3hBBM9ppuZeH/Xy4eNROVtwo5GE81zegwvnGnU=;
 b=S3g768h/qg61UFIr+oXtHH+4E/6og3mNqo0DzY618HZdzG9+E+pOIMs8FY/yQSHfhC
 8hFXjlHsMLLU8LLJKEsnvl5mBJlvgqtOp4YZu3+6XR2+e86NVI+LZw3+PgpOYCapuWwn
 xc6ofjLibNIo5zvKW3/Lt0ryeNESWVDyJRh/icZHho7fc5/F/2hdAxxe6O4UEiZ4Y3WK
 5dQWiO/7wFRkEektG/RXn82qMl9uXgtztS7gA5YXbAQctoNYzmR28uLqptsT/vfFir1F
 0WmccWdhDizKGm/b54nvHbmToZbtPyotVBhe8ObcAsUDfieur9U+6eacMaTBQwTSFnUV
 qbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h8V5q3hBBM9ppuZeH/Xy4eNROVtwo5GE81zegwvnGnU=;
 b=VKWkWbKXXolKlhMifdjhCseonWMgz7JNVfCj/NahRxwETSXKdlkG1abtqeDXl6LM1v
 1qLYFntfiltCaRw+u3b+hA1Lb5na0pmCjRuzmZJR+NimOgb8rZStg8QgvqNhwxt6kF9I
 zfzAgXg/HueiSJKYhqGPfGDG4lsnsNLkCCBdxOo35yJDH9lak9JIk3u4EFrUrHKC1he6
 m0jJpLqPSxgarTw6aigMwLdM3+v4CssA0A347NYasjvA4Y5v0GJwgQNFaI5re6lsnOjg
 8E9mewlcmWUZqmV+xeqG91glTNBh6/gq8kun53CKoVF1YGDA1gDLh7SZV+BuJH5n1CZK
 yOXw==
X-Gm-Message-State: AOAM53059TyNlIqFtLxHahXw79PpGsAs2GPO7LULYxPmYNHWCtw52/hu
 M9rW0klL1cGg0+mUPn0ahmGEMA==
X-Google-Smtp-Source: ABdhPJwavZPyjCsEMgucy9HCbyMFL6IkNC+opMYPqy3LtDW9qjuur+mPiu2YegnxGZ+dir2bwGhDBQ==
X-Received: by 2002:a02:8b:: with SMTP id 133mr2332650jaa.46.1601661724723;
 Fri, 02 Oct 2020 11:02:04 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id s23sm994865iol.23.2020.10.02.11.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 11:02:04 -0700 (PDT)
To: Peilin Ye <yepeilin.cs@gmail.com>,
 syzbot <syzbot+85433a479a646a064ab3@syzkaller.appspotmail.com>
References: <000000000000a24fa705ae29dc6c@google.com>
 <20201002142223.9482-1-yepeilin.cs@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <afa31e81-84d9-fc54-e6cf-a8301f1cf33a@kernel.dk>
Date: Fri, 2 Oct 2020 12:02:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002142223.9482-1-yepeilin.cs@gmail.com>
Content-Language: en-US
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, glider@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] block/scsi-ioctl: Fix
 kernel-infoleak in scsi_put_cdrom_generic_arg()
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

On 10/2/20 8:22 AM, Peilin Ye wrote:
> scsi_put_cdrom_generic_arg() is copying uninitialized stack memory to
> userspace, since the compiler may leave a 3-byte hole in the middle of
> `cgc32`. Fix it by adding a padding field to `struct
> compat_cdrom_generic_command`.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
