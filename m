Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419A1EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Jul 2023 13:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA34F82B21;
	Fri,  7 Jul 2023 13:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA34F82B21
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cIGOoBBO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsLl8HpWeLM1; Fri,  7 Jul 2023 13:51:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BB89782B1A;
	Fri,  7 Jul 2023 13:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB89782B1A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A071BC0072;
	Fri,  7 Jul 2023 13:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40431C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 13:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1373441BC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 13:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1373441BC1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cIGOoBBO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnBBtCuYlM31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 13:51:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF2741BBF
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEF2741BBF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 13:51:22 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-55b1238a013so1345121a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Jul 2023 06:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688737882; x=1691329882;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6Iantu54ZuEmJPSontbxiYXeQ/uVqcnAm95dc5tYGWA=;
 b=cIGOoBBO/Goe8+eNUd5wDyMH5LoNn7XgsE7WKW8hUSF7/z6bTAzkWIYPniQfhE+O8r
 sVkgs1fwUYuFsZnUbnHEhWfl5EX3nPxhy875qaLakpWlPad4GHAnapJdFxi9Rc5fWSkY
 yA7dEwM9HUHU2cedBsUnE/UD2pT4NnO4vZF0OsfIyh53BkqMdbVDvegyW9eozLrD/d48
 fmezk8nR097iS1MnSx7MYiBNMMogT8LTqw8KaKmse/RZhQEmV5U97CX2B/pmNdKSviIm
 Vq0eG6edcnzG4aS8GYFOjhYhMxvtpTl2aiCrA20wlJ5jb4adirEpiQA91fUtss/fidrN
 Jthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688737882; x=1691329882;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Iantu54ZuEmJPSontbxiYXeQ/uVqcnAm95dc5tYGWA=;
 b=iABKmRts+edxiifg5/lbESmAhDrbGIYgYOTB25R32vL8K4d6YSFgv1LCUE7ebGL3tL
 7OKKF5AV6iCjtjfXVRF9MwztXuUTB7MBbl1E3IKoS6OkBsZwVbjiGQbAJsK/DH4svlIr
 oVMA+5WNS+9a2kaOvlBomVZN0w0/StnnDY90eK4lcVMk1ELYw4G5Fe1cYX7+CDo+8dgR
 yQAZKG1nFzgGem8EuDOXkmWhkJSmd6XZgrGhpwse5ZOQnlYNJy9yDNJwQQx/3fJRHrKt
 ZTZDsERYApqV51ge9m2wck6vKnKjRblQEODvLSofFFqHuDEYh8XW0yxsgWTn1wD5oqTh
 c0aA==
X-Gm-Message-State: ABy/qLYnwtPP/uHtDZCgUuu6KlsjpLE9GSC9SqfELB8sOWBhLJz8SUau
 K71a65S611ixHaYEsG/ynWI=
X-Google-Smtp-Source: APBJJlGp7WNiasg9ojoZCynU+KGGC9G6kkLMtkFYzj27RCGzd4sJZyjBycCv7Mygm/7QqS8YhQZbKQ==
X-Received: by 2002:a05:6a20:3c9e:b0:12f:bca:d9ae with SMTP id
 b30-20020a056a203c9e00b0012f0bcad9aemr5667657pzj.59.1688737881919; 
 Fri, 07 Jul 2023 06:51:21 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a170902b68d00b001a24cded097sm3283254pls.236.2023.07.07.06.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 06:51:21 -0700 (PDT)
Message-ID: <dc7a79e0-acfa-c65e-d9db-80806758f846@gmail.com>
Date: Fri, 7 Jul 2023 20:51:18 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
To: Ivan Orlov <ivan.orlov0322@gmail.com>
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <4e4a3024-0482-665c-212f-f0084f404239@gmail.com>
Content-Language: en-US
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <4e4a3024-0482-665c-212f-f0084f404239@gmail.com>
Cc: daniel@iogearbox.net, linux-kernel-mentees@lists.linuxfoundation.org,
 ast@kernel.org, andrii@kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev
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

Thanks, will do

On 7/7/23 02:43, Ivan Orlov wrote:
> On 06.07.2023 20:00, Anh Tuan Phan wrote:
>> Update the Documentation to mention that some samples require pahole
>> v1.16 and kernel built with CONFIG_DEBUG_INFO_BTF=y
>>
>> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
>> ---
> 
> Minor nit: you should write what changed since the first version of the
> patch here, otherwise the changes are pretty hard to follow.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
