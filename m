Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98D2C2FC0E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 09:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A7B541816;
	Thu, 17 Aug 2023 09:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A7B541816
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fPihYR+i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XpwirIbBo6Wa; Thu, 17 Aug 2023 09:21:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 348484180A;
	Thu, 17 Aug 2023 09:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 348484180A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D73CC0071;
	Thu, 17 Aug 2023 09:21:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0CDAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DED441811
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DED441811
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_jz38YR13ra
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:21:54 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33C424180A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C424180A
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6889078ee66so1203306b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692264113; x=1692868913;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SQs2iirMBYyeAMahOY50mDUR4NQKE6tkGZ5ZARpOjG0=;
 b=fPihYR+ioPrcnNvKWxJLA3AKVfaCi+u62mnwS5clWqWQG0qdhsfFZx9J+PjzLJKjib
 0dxF6uuLdW392GKiDhckmYR8XXBk9vn0ET8erRmYrXuMUMs2jyGF637+mEOHiONFvSYF
 lZ6L3pGsdQfrR0rqygxtIwvHl5sh49wnkZXbOboD4pt/fLlK7WPu+Yt2zVvIOlWwq6GI
 cCSY8SBmmSOzYaI+KlNMVcsw2zlfnG+FNdZ+Lo/HcAGkwZfuAAFRT99ibu56T9Z3M/xU
 yOjJDLtpElcB3ligbcJ/C+Ojn3PkSX1oyc8vAUD9penYErHMVv88A5c3WqIpon4Ok23a
 65jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692264113; x=1692868913;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQs2iirMBYyeAMahOY50mDUR4NQKE6tkGZ5ZARpOjG0=;
 b=llxPOMsgcHh3itmc2XwZOyzfVIM/DmJ4ITp6sxzvauxPKEq/NX4iIQDZtlTiMaFcMm
 PIfCkwr1jtDds4MWq6gR6q8gS2DLnNUQ1Th10O1HmMkjokXVLnc4mj1DFKS2mYUUMeSD
 SpV/Rt3O9jTYxZX8Bg1z2+6loKzu9jmJjJXsdUdUsOb+OjXs+w1NvdvSdberYFAho72S
 LVzvO/36qupm7StPbjdjbs/w4oqaQHo4PPCwtSB2CN+yYpNiUaPPoQgx5JPBISysavUB
 s6v1vZwLT4bdfdDeGxlTt6oUhXy7inytuGoXol4ya+FfTPkFgbpgL7PlwE4BTHIryCbV
 9nTA==
X-Gm-Message-State: AOJu0Yxe5T/SARBVG1MQmBuLrlPUAuwQNdVJNSGdLJbNB5tluIAMJhQw
 pjxjcDjmtLvfJLfe3b3p+VU=
X-Google-Smtp-Source: AGHT+IECzFfJxHoNRPkfwgfOAyjabTcKnbc+FzB0G6CHancwE/uNi8x0hMrYxi2xagXdY6Qlk9e2PQ==
X-Received: by 2002:a05:6a21:3e0c:b0:144:5d5b:8e24 with SMTP id
 bk12-20020a056a213e0c00b001445d5b8e24mr4198600pzc.24.1692264113469; 
 Thu, 17 Aug 2023 02:21:53 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:58e9:1afa:cf81:3a3:6ec8])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a62e517000000b0064f76992905sm12376503pff.202.2023.08.17.02.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 02:21:53 -0700 (PDT)
Date: Thu, 17 Aug 2023 14:51:48 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v1] selftests: ipc: Updates the msgque test to use
 kselftest framework
Message-ID: <20230817092148.GB72739@atom0118>
References: <20230723064154.89443-1-atulpant.linux@gmail.com>
 <26d32ad9-6b83-d959-adae-d7181695db18@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26d32ad9-6b83-d959-adae-d7181695db18@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Aug 16, 2023 at 09:45:10AM -0600, Shuah Khan wrote:
> On 7/23/23 00:41, Atul Kumar Pant wrote:
> > Updates the msgque test to print the pass or fail status after the
> > completion of the test.
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >   tools/testing/selftests/ipc/msgque.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
> > index 656c43c24044..513b1265bb75 100644
> > --- a/tools/testing/selftests/ipc/msgque.c
> > +++ b/tools/testing/selftests/ipc/msgque.c
> > @@ -9,6 +9,7 @@
> >   #include "../kselftest.h"
> > +#define NUM_TEST_CASES		1
> >   #define MAX_MSG_SIZE		32
> >   struct msg1 {
> > @@ -197,6 +198,7 @@ int main(int argc, char **argv)
> >   	int msg, pid, err;
> >   	struct msgque_data msgque;
> > +	ksft_set_plan(NUM_TEST_CASES);
> >   	if (getuid() != 0)
> >   		return ksft_exit_skip(
> >   				"Please run the test as root - Exiting.\n");
> > @@ -243,13 +245,16 @@ int main(int argc, char **argv)
> >   		printf("Failed to test queue: %d\n", err);
> >   		goto err_out;
> >   	}
> > +	ksft_test_result_pass("# Test Passed\n");
> >   	return ksft_exit_pass();
> >   err_destroy:
> >   	if (msgctl(msgque.msq_id, IPC_RMID, NULL)) {
> >   		printf("Failed to destroy queue: %d\n", -errno);
> > +		ksft_test_result_fail("# Test Failed\n");
> >   		return ksft_exit_fail();
> >   	}
> >   err_out:
> > +	ksft_test_result_fail("# Test Failed\n");
> >   	return ksft_exit_fail();
> >   }
> 
> I am not seeing any value in adding these. It already has messages
> in error legs and it prints totals at the end:
> 
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> thanks,
> -- Shuah

	The stats printed at the end have no account of whether the test passed
	or failed. As seen in the totals message at the end, all the values for
	various test results (pass, fail,xfail, xpass,skip and error) is 0.
	With this patch we'll get the totals at the end of test like:
	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
