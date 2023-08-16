Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4488FC001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 15:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E0D83579;
	Wed, 16 Aug 2023 15:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E0D83579
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=K6QVykcZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InqmrcqSeJDO; Wed, 16 Aug 2023 15:45:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AFC1B83547;
	Wed, 16 Aug 2023 15:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC1B83547
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B6B1C0072;
	Wed, 16 Aug 2023 15:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7EBFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 15:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF34140305
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 15:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF34140305
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=K6QVykcZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJfIAtNE3-AJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 15:45:14 +0000 (UTC)
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9B6740304
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 15:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B6740304
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1a2dd615ddcso912728fac.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1692200713; x=1692805513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qEU+8ucHz0YvKsSQ3I6NswEdG1bcEE/gZGFPl1VDIx8=;
 b=K6QVykcZbYwc/o6zSziCiKSG+diRzFDHgi7SMz9eb1TIoTwuPsSfoo14OZK8XMuyCp
 mTVALWlqHxpqsaMb1RAkiEiZpONH/yqoESQkoBWJBY+4KmeZLDG86FPqfhp0W5dGsKcN
 uFgVOSzz5RQo3HepuMDIJ5ik4eSO3dxEtA3ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692200713; x=1692805513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qEU+8ucHz0YvKsSQ3I6NswEdG1bcEE/gZGFPl1VDIx8=;
 b=TL4O/NFiQq99T9LntpkGbR+pTwD/tUmlo/A9SFWa/sx/bNQdQ+gRoEtd1GF5hfqc7V
 BXoTdt/0InA7XV5WRhs6nOZlB2KYFTkf9GnhOZ289PYeV3xffYnzFN4xxxJUE+FlMoYW
 psYNgDpygfwnYmuc6+FtDD9uU1hqfjctO4y83G/JETQY+X6REbBMPlexUNGsOrwWz+Fv
 L1PGJLVrKrnL3p+92tSKVW4SqSPpswy1wmNGonu2eYPx6/hwTznCHszKiXig0H8tTS/K
 2lzWZnX1/xzxxXFH44bczP3x25H3Fe6KQzR1U0gbKgm6AEqLeAEe8c0jjuZHlan3yPdI
 fQww==
X-Gm-Message-State: AOJu0YwxONq/JZ/KFt9tfbnZEB0t/kP1MhId/cklYgT4dFIjnKenhstY
 49HGoj/A4iBGzVChixfPO2OcnAn5
X-Google-Smtp-Source: AGHT+IFZI1bmpt8fYRO2PdzcSUfT+9kORGQxxdbSVlMJZKnSIVeZddLfgx78SoeNnj0JlLFaARQHiQ==
X-Received: by 2002:a05:6871:85:b0:1bf:9fa2:bfa3 with SMTP id
 u5-20020a056871008500b001bf9fa2bfa3mr2207319oaa.1.1692200713576; 
 Wed, 16 Aug 2023 08:45:13 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 zc13-20020a056871270d00b001c03d1a519fsm7545465oab.39.2023.08.16.08.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 08:45:12 -0700 (PDT)
Message-ID: <26d32ad9-6b83-d959-adae-d7181695db18@linuxfoundation.org>
Date: Wed, 16 Aug 2023 09:45:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] selftests: ipc: Updates the msgque test to use
 kselftest framework
Content-Language: en-US
To: Atul Kumar Pant <atulpant.linux@gmail.com>, shuah@kernel.org
References: <20230723064154.89443-1-atulpant.linux@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230723064154.89443-1-atulpant.linux@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 7/23/23 00:41, Atul Kumar Pant wrote:
> Updates the msgque test to print the pass or fail status after the
> completion of the test.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
>   tools/testing/selftests/ipc/msgque.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
> index 656c43c24044..513b1265bb75 100644
> --- a/tools/testing/selftests/ipc/msgque.c
> +++ b/tools/testing/selftests/ipc/msgque.c
> @@ -9,6 +9,7 @@
>   
>   #include "../kselftest.h"
>   
> +#define NUM_TEST_CASES		1
>   #define MAX_MSG_SIZE		32
>   
>   struct msg1 {
> @@ -197,6 +198,7 @@ int main(int argc, char **argv)
>   	int msg, pid, err;
>   	struct msgque_data msgque;
>   
> +	ksft_set_plan(NUM_TEST_CASES);
>   	if (getuid() != 0)
>   		return ksft_exit_skip(
>   				"Please run the test as root - Exiting.\n");
> @@ -243,13 +245,16 @@ int main(int argc, char **argv)
>   		printf("Failed to test queue: %d\n", err);
>   		goto err_out;
>   	}
> +	ksft_test_result_pass("# Test Passed\n");
>   	return ksft_exit_pass();
>   
>   err_destroy:
>   	if (msgctl(msgque.msq_id, IPC_RMID, NULL)) {
>   		printf("Failed to destroy queue: %d\n", -errno);
> +		ksft_test_result_fail("# Test Failed\n");
>   		return ksft_exit_fail();
>   	}
>   err_out:
> +	ksft_test_result_fail("# Test Failed\n");
>   	return ksft_exit_fail();
>   }

I am not seeing any value in adding these. It already has messages
in error legs and it prints totals at the end:

# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
