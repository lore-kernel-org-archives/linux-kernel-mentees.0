Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224F1C76195
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Mar 2023 19:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49DE040E46;
	Mon, 27 Mar 2023 19:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49DE040E46
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ehHWsi8o
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LavzFeXmrmFk; Mon, 27 Mar 2023 19:55:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0910E409F4;
	Mon, 27 Mar 2023 19:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0910E409F4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5F43C007C;
	Mon, 27 Mar 2023 19:55:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28855C007A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0248861089
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 19:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0248861089
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=ehHWsi8o
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEzXrIfYLM3d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 19:55:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA6A60F47
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEA6A60F47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 19:55:03 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id f14so4394751iow.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 12:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1679946903;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jIAxQ/0le8FlOj+IPxrPghHwfvROX6X5lZ45OBU9CpE=;
 b=ehHWsi8ogs9OJVu4wXJQKImFL6wt2lQeGAx4d5rNgRPBtYlfI3ZSnHJyzWYEXid4vD
 fs1DCNfa9aNq+LL0N8LVdciV/bUAwVt+vwObrgMCxjDnETDcFujji1OVT9XfM6WbBULd
 huMLkbreYZr6YAkEzzaxyV1sJag91j+Lcm1CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679946903;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jIAxQ/0le8FlOj+IPxrPghHwfvROX6X5lZ45OBU9CpE=;
 b=2Okk7AAcUBXEt6Koug22ZsDWGxHHHYqdF/DXg7xdBHJmTXjtGGr6UwiXAIC+xvR0vb
 ghwyd3hNPxts5H4sdXHX2b+hQ9xWvOAljPjekblI1aQ5btv3pH6jiMkYH+CRovgS/poN
 /N1t2rV1I9t7FRrqsHjzutVEGn8ZPHnAE3bgvnA/rvrLPcV7yLfCPV1reROvq3f1hU9M
 b/9klLSnDMyXlK0OEgYIx3CzS/fpjqoYw01tzL2XRLMUeKdzmuzVgzj7d29ATl/++pii
 RnU6CFAcjIQsuIbb9wbojQwHpphWc0jaXy3bRM3f0OYnqzEercOpzviQYJOMwOTOmrnc
 7NDw==
X-Gm-Message-State: AO0yUKUF5GFNALsxS2bXz+qdZJAiDJV2RDdrk5a/SUbkOvYBXEqBdYbL
 IWXD8CDSUW5BvGA/m+bxw5aHCsDy
X-Google-Smtp-Source: AK7set9wLOdd/3cNTHjZbEdlZrWVXGvXa4KBBe1RdlVKD1TsBILNtisys2P7KkX7s08Vc/9+6NSAlQ==
X-Received: by 2002:a05:6602:1301:b0:758:6ae8:8e92 with SMTP id
 h1-20020a056602130100b007586ae88e92mr7583950iov.1.1679946902905; 
 Mon, 27 Mar 2023 12:55:02 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 p5-20020a02b005000000b004063510ba0esm9181046jah.142.2023.03.27.12.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 12:55:02 -0700 (PDT)
Message-ID: <af254c18-d55b-7343-32f8-d24ef0072e2c@linuxfoundation.org>
Date: Mon, 27 Mar 2023 13:55:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] selftests: sched: Add more core schedule prctl calls
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, shuah@kernel.org
References: <20230322203724.4757-1-ivan.orlov0322@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230322203724.4757-1-ivan.orlov0322@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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

Hi Ivan,

On 3/22/23 14:37, Ivan Orlov wrote:
> The core sched kselftest makes prctl calls only with correct
> parameters. This patch will extend this test with more core
> schedule prctl calls with wrong parameters to increase code
> coverage.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

Thank you for the patch.

> ---
>   tools/testing/selftests/sched/cs_prctl_test.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
> index 25e0d95d3713..df8e4629b3b5 100644
> --- a/tools/testing/selftests/sched/cs_prctl_test.c
> +++ b/tools/testing/selftests/sched/cs_prctl_test.c
> @@ -334,6 +334,14 @@ int main(int argc, char *argv[])
>   	validate(get_cs_cookie(pid) != 0);
>   	validate(get_cs_cookie(pid) == get_cs_cookie(procs[pidx].thr_tids[0]));
>   
> +	printf("\n## Try to pass wrong subcommand PR_SCHED_CORE_MAX = %d to prctl (shouldn't succeed)\n", PR_SCHED_CORE_MAX);

This message is unnecessary. validate() prints an error message.

> +	validate(_prctl(PR_SCHED_CORE, PR_SCHED_CORE_MAX, 0, PIDTYPE_PGID, 0) < 0
> +		&& errno == EINVAL);
> +
> +	printf("\n## Try to pass not-null uaddr with forbidden command (shouldn't succeed)\n");

Same here.

> +	validate(_prctl(PR_SCHED_CORE, PR_SCHED_CORE_SHARE_TO, 0, PIDTYPE_PGID, 1) < 0
> +		&& errno == EINVAL);
> +
>   	if (errors) {
>   		printf("TESTS FAILED. errors: %d\n", errors);
>   		res = 10;

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
