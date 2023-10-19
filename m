Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE250C41513
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Oct 2023 18:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7349E42D08;
	Thu, 19 Oct 2023 18:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7349E42D08
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UPxHd2Z5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSvysiXT7IKF; Thu, 19 Oct 2023 18:39:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6844742CD3;
	Thu, 19 Oct 2023 18:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6844742CD3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 437D1C0071;
	Thu, 19 Oct 2023 18:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33720C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 18:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0641E84445
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 18:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0641E84445
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UPxHd2Z5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKD7bj2JtDM3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 18:39:17 +0000 (UTC)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1DB084174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 18:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1DB084174
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-58e119bb28eso871609a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Oct 2023 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697740757; x=1698345557;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vvpiQJ6k/a5eGoEtij7HD0ulJSwtg8u7MSw+T7gzmSU=;
 b=UPxHd2Z5jvF6Vz8gtupioVRCAMfaqy0F931828hkAgbRzj/UT+MDi6XClfL3L0Zd7X
 dFln6vkWN/T8tFTAET1aritipKm5yfcP0fkm2APMq5iIAqYZmPK4Uv7P1mpzQtosKbaw
 Hn4jL+9ZYaPZLq63aYFf4JN4UqRpunn+rijEQO3Yn2g9r12blbNeclCdsN3p8/4S1Eoj
 2RF/LZ5ihBvjA1RAZT+htz5pbMhqY7ZtghhYVqxw1w3ayjOD3XKCRL98USnKbhZEHEzB
 F8E75gF7F10rQU7LvNfh0TIfzcqLO7xXRimSrnlMb1LGm7csBIk50wpzhoIyrHNHT8Ww
 AokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697740757; x=1698345557;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vvpiQJ6k/a5eGoEtij7HD0ulJSwtg8u7MSw+T7gzmSU=;
 b=gagP0ufgf5Jp+ZHQ3hQdCtAF1V06u3NGqvQyco2Pz+FeEs2WzSnYNkb6XkYsmYL4Q+
 uDN68s0GeTAbloCYMg4aryd0GKKjpkUPBpE9AlOCOnBoUm7Po/gWm+4JNKkt+djdpAnx
 RRYsrXput+cZVcK+z/mNPmOMwtVQv6FBznNtePjXX8T/wk+PEOAzIvA99W5t3ixgxL4E
 XD6bMZ4pGN5Dt4PDjzs9hphjZglXHLVOgaBbyIoHFIvcEVOKaqa91i4STyoMZo1zrqea
 T6oa5Vtn1Wog60kRGUTeyoxaSogK+2p9tOBWe+edcuG/2zxJBFaq7CvCXZyIi7Md8LMA
 BcJw==
X-Gm-Message-State: AOJu0YzcvGfs4SP0PU7IGrq8NuVUILfSfDMNUGmSbUMKC8Z2gXItv976
 c48cThSfXFPXVV760BznZFU=
X-Google-Smtp-Source: AGHT+IGbvNaUkXhmHNOJH60DIlmREOyBTMp0AT7sUzSL3oI7VuUV2u2yhSbTsgI9O7bI1wNMFch8Sw==
X-Received: by 2002:a17:90b:48c4:b0:274:8951:b5ed with SMTP id
 li4-20020a17090b48c400b002748951b5edmr3943674pjb.20.1697740756903; 
 Thu, 19 Oct 2023 11:39:16 -0700 (PDT)
Received: from swarup-virtual-machine ([171.76.85.44])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a17090a7a8f00b00256b67208b1sm1830933pjf.56.2023.10.19.11.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 11:39:16 -0700 (PDT)
Date: Fri, 20 Oct 2023 00:09:11 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, luto@kernel.org
Subject: Re: [PATCH] selftests: capabilities: namespace create varies for
 root and normal user
Message-ID: <ZTF3z9gKJCn3bQ7w@swarup-virtual-machine>
References: <20230929125348.13302-1-swarupkotikalapudi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230929125348.13302-1-swarupkotikalapudi@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

esOn Fri, Sep 29, 2023 at 06:23:48PM +0530, Swarup Laxman Kotiaklapudi wrote:
> Change namespace creation for root and non-root
> user differently in create_and_enter_ns() function
> 
> Test result with root user:
> $sudo make  TARGETS="capabilities" kselftest
>  ...
>  TAP version 13
>  1..1
>  timeout set to 45
>  selftests: capabilities: test_execve
>  TAP version 13
>  1..12
>  [RUN]       +++ Tests with uid == 0 +++
>  [NOTE]      Using global UIDs for tests
>  [RUN]       Root => ep
>  ...
>  ok 12 Passed
>  Totals: pass:12 fail:0 xfail:0 xpass:0 skip:0 error:0
>  ==================================================
>  TAP version 13
>  1..9
>  [RUN]       +++ Tests with uid != 0 +++
>  [NOTE]      Using global UIDs for tests
>  [RUN]       Non-root => no caps
>  ...
>  ok 9 Passed
>  Totals: pass:9 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Test result without root or normal user:
> $make  TARGETS="capabilities" kselftest
>  ...
>  timeout set to 45
>  selftests: capabilities: test_execve
>  TAP version 13
>  1..12
>  [RUN]       +++ Tests with uid == 0 +++
>  [NOTE]      Using a user namespace for tests
>  [RUN]       Root => ep
>  validate_cap:: Capabilities after execve were correct
>  ok 1 Passed
>  Check cap_ambient manipulation rules
>  ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
>  ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
>  ok 4 PR_CAP_AMBIENT_RAISE worked
>  ok 5 Basic manipulation appears to work
>  [RUN]       Root +i => eip
>  validate_cap:: Capabilities after execve were correct
>  ok 6 Passed
>  [RUN]       UID 0 +ia => eipa
>  validate_cap:: Capabilities after execve were correct
>  ok 7 Passed
>  ok 8 # SKIP SUID/SGID tests (needs privilege)
>  Planned tests != run tests (12 != 8)
>  Totals: pass:7 fail:0 xfail:0 xpass:0 skip:1 error:0
>  ==================================================
>  TAP version 13
>  1..9
>  [RUN]       +++ Tests with uid != 0 +++
>  [NOTE]      Using a user namespace for tests
>  [RUN]       Non-root => no caps
>  validate_cap:: Capabilities after execve were correct
>  ok 1 Passed
>  Check cap_ambient manipulation rules
>  ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
>  ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
>  ok 4 PR_CAP_AMBIENT_RAISE worked
>  ok 5 Basic manipulation appears to work
>  [RUN]       Non-root +i => i
>  validate_cap:: Capabilities after execve were correct
>  ok 6 Passed
>  [RUN]       UID 1 +ia => eipa
>  validate_cap:: Capabilities after execve were correct
>  ok 7 Passed
>  ok 8 # SKIP SUID/SGID tests (needs privilege)
>  Planned tests != run tests (9 != 8)
>  Totals: pass:7 fail:0 xfail:0 xpass:0 skip:1 error:0
> 
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> ---
>  tools/testing/selftests/capabilities/test_execve.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/capabilities/test_execve.c b/tools/testing/selftests/capabilities/test_execve.c
> index df0ef02b4036..8236150d377e 100644
> --- a/tools/testing/selftests/capabilities/test_execve.c
> +++ b/tools/testing/selftests/capabilities/test_execve.c
> @@ -96,11 +96,7 @@ static bool create_and_enter_ns(uid_t inner_uid)
>  	outer_uid = getuid();
>  	outer_gid = getgid();
>  
> -	/*
> -	 * TODO: If we're already root, we could skip creating the userns.
> -	 */
> -
> -	if (unshare(CLONE_NEWNS) == 0) {
> +	if (outer_uid == 0 && unshare(CLONE_NEWNS) == 0) {
>  		ksft_print_msg("[NOTE]\tUsing global UIDs for tests\n");
>  		if (prctl(PR_SET_KEEPCAPS, 1, 0, 0, 0) != 0)
>  			ksft_exit_fail_msg("PR_SET_KEEPCAPS - %s\n",
> -- 
> 2.34.1
> 
Hi Shuah,
Please review this patchset.
Thanks,
Swarup
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
