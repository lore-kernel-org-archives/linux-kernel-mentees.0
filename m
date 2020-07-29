Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14B0C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 13:22:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9597B20809
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 13:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9597B20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5B7F822DE3;
	Wed, 29 Jul 2020 13:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSCbrXeCHluH; Wed, 29 Jul 2020 13:22:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9D4102052C;
	Wed, 29 Jul 2020 13:22:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88E58C0050;
	Wed, 29 Jul 2020 13:22:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DA56C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 13:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 26707863C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 13:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSwA63tS3YS4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 13:22:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0555D86341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 13:22:46 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id b11so13008758lfe.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 06:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cZW4UMP8peVI8CAVoM7H793wrysqn0IQcJWFXMg3ih4=;
 b=jMKpQy1E68ssRrqqWZ1qmlyAqiP9UHnfQ9dZjgsChWfMiuFGHLd4D1NXBmytiRPqi4
 qGtKJu1kpQibLmjOXTaRosl7T1pwVoaX91CshXbUYgBOdjmhnp+hBq571pGjC+Zb4AXD
 /Z+unQAxOsCw+SaQSljXBUNsVwM16kMpaYTWUSHNoIZ4a+2v2lImicA/DF50saO3CxrP
 kNexvuHArp9VGrmlWsOBZ1X9y1DKk7KU9AvAfDZ+VM7ri6d0noz6ZLQN/TFCqd17cF3Y
 2q9qH6LtNfGoC1wIFe/1fZllef6a7oWpjLHsoscxEPvRCREnBobg7lBg9KNYBlS/NkKz
 4lHQ==
X-Gm-Message-State: AOAM533GTgB0GUgkl2aCu/zw0auDvGYA4rgRjOFDmZJXl5skyc4IJdBJ
 Zu5+rHjKbt3NUgi7+mtdFfDlz/vImC4=
X-Google-Smtp-Source: ABdhPJzYdM9IChNCDxmOZQNLlsjUhA0B/O098QWKu7ir9TkG2hlIKY8+RjS6Grex1S82haTXiIdZdg==
X-Received: by 2002:ac2:5223:: with SMTP id i3mr17629828lfl.57.1596028963727; 
 Wed, 29 Jul 2020 06:22:43 -0700 (PDT)
Received: from [10.68.32.147] (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.gmail.com with ESMTPSA id y1sm555490lfb.45.2020.07.29.06.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 06:22:42 -0700 (PDT)
To: Dan Carpenter <dan.carpenter@oracle.com>, Peilin Ye <yepeilin.cs@gmail.com>
References: <20200728141946.426245-1-yepeilin.cs@gmail.com>
 <20200729115157.8519-1-yepeilin.cs@gmail.com> <20200729125820.GB1840@kadam>
From: Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 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
Message-ID: <f2cf6137-987a-ab41-d88a-6828d46c255f@linux.com>
Date: Wed, 29 Jul 2020 16:22:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729125820.GB1840@kadam>
Content-Language: en-US
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] block/floppy: Prevent
 kernel-infoleak in raw_cmd_copyout()
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
Reply-To: efremov@linux.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 7/29/20 3:58 PM, Dan Carpenter wrote:
> Argh...  This isn't right still.  The "ptr" comes from raw_cmd_copyin()
> 
> ptr = kmalloc(sizeof(struct floppy_raw_cmd), GFP_KERNEL);
> 

copy_from_user overwrites the padding bytes:
	ptr = kmalloc(sizeof(struct floppy_raw_cmd), GFP_KERNEL);
	if (!ptr)
		return -ENOMEM;
	*rcmd = ptr;
	ret = copy_from_user(ptr, param, sizeof(*ptr));

I think memcpy should be safe in this patch.

I've decided to dig a bit into the issue and to run some tests.
Here are my observations:

$ cat test.c

#include <stdio.h>
#include <string.h>

#define __user

struct floppy_raw_cmd {
	unsigned int flags;
	void __user *data;
	char *kernel_data; /* location of data buffer in the kernel */
	struct floppy_raw_cmd *next; /* used for chaining of raw cmd's 
				      * within the kernel */
	long length; /* in: length of dma transfer. out: remaining bytes */
	long phys_length; /* physical length, if different from dma length */
	int buffer_length; /* length of allocated buffer */

	unsigned char rate;

#define FD_RAW_CMD_SIZE 16
#define FD_RAW_REPLY_SIZE 16
#define FD_RAW_CMD_FULLSIZE (FD_RAW_CMD_SIZE + 1 + FD_RAW_REPLY_SIZE)

	unsigned char cmd_count;
	union {
		struct {
			unsigned char cmd[FD_RAW_CMD_SIZE];
			unsigned char reply_count;
			unsigned char reply[FD_RAW_REPLY_SIZE];
		};
		unsigned char fullcmd[FD_RAW_CMD_FULLSIZE];
	};
	int track;
	int resultcode;

	int reserved1;
	int reserved2;
};

void __attribute__((noinline)) stack_alloc()
{
	struct floppy_raw_cmd stack;
	memset(&stack, 0xff, sizeof(struct floppy_raw_cmd));
	asm volatile ("" ::: "memory");
}

int __attribute__((noinline)) test(struct floppy_raw_cmd *ptr)
{
	struct floppy_raw_cmd cmd = *ptr;
	int i;

	for (i = 0; i < sizeof(struct floppy_raw_cmd); ++i) {
		if (((char *)&cmd)[i]) {
			printf("leak[%d]\n", i);
			return i;
		}
	}

	return 0;
}

int main(int argc, char *argv[])
{
	struct floppy_raw_cmd zero;

	memset(&zero, 0, sizeof(struct floppy_raw_cmd));
	// For selfcheck uncomment:
	// zero.resultcode = 1;
	stack_alloc();
	return test(&zero);
}

Next, I've prepared containers with gcc 4.8 5 6 7 8 9 10 versions with this
tool (https://github.com/a13xp0p0v/kernel-build-containers).

And checked for leaks on x86_64 with the script test.sh
$ cat test.sh
#!/bin/bash

for i in 4.8 5 6 7 8 9 10
do
./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc test.c; ./a.out'
./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc -O2 test.c; ./a.out'
./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc -O3 test.c; ./a.out'
done

No leaks reported. Is it really possible this this kind of init, i.e. cmd = *ptr?

https://lwn.net/Articles/417989/ (December 1, 2010).
GCC 4.9.4 released [2016-08-03]
Maybe this behavior changed.

https://www.nccgroup.com/us/about-us/newsroom-and-events/blog/2019/october/padding-the-struct-how-a-compiler-optimization-can-disclose-stack-memory/
Reports for >= 4.7, < 8.0 version. But I can't find a word about this
kind of inits: cmd = *ptr.

Thanks,
Denis
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
