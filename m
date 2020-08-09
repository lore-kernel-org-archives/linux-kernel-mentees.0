Return-Path: <SRS0=eSSj=BT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3D2C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Aug 2020 15:12:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 637C7206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Aug 2020 15:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3+JpB+W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 637C7206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32FC4877A8;
	Sun,  9 Aug 2020 15:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iagE17jB2iic; Sun,  9 Aug 2020 15:12:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A81FB886A7;
	Sun,  9 Aug 2020 15:12:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E028C0864;
	Sun,  9 Aug 2020 15:12:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E0ECC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 15:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6E5F120508
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 15:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ch4Lh2Xy0a-v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 15:11:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 8593520364
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 15:11:30 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x25so435628pff.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Aug 2020 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3U1YVfZ3/r+GTB6gjCpbjGoBmp0JEystLJz/+YctVAQ=;
 b=P3+JpB+WUDWhDsCjxZF/OtdUOVzHJ2RM0GUjGZgEfAuODBqdcetEXFytsyhvGwl6iG
 7jpquCJudc/UWaMo2r5UmytWUIad6p4gl3MgSZ76uY6+ZLepknpkIuMk05vC5NXY8bPB
 aC51eq5rPnX+oKQxQH9bBrJ7br6kkKvzPrY1zrguhbxJBaCCzEOxZhf+TL2ai/FxeTej
 lkQtf9a6iELZuOC21MKzCS3UaPmm8sopmJRzp1OwN//Bvrzol9XQfo6i7epSZuTZhZrZ
 utgbV1GnmdNimoiQ9LjVflso8qd9fYitfT2WG8XjtGrF4f97ADt1xHf0swQ9yDq+clP3
 4FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3U1YVfZ3/r+GTB6gjCpbjGoBmp0JEystLJz/+YctVAQ=;
 b=E7cZQeuw2JDdLS8PgfcRal1Dwv2Cv9dEXNcqn1JNCwfQXAuJn/m+SLQ6jGFfyzsNTg
 H6zvUs2s70c3YmrP+6+dj0N2iCqQgSYWsbaTMM/LN5V8DtnQgjH/h7srdtfgS8nyPiwC
 aRTrGUJRKljyYkhSXOXHcW2ZefKB5Ub96M6bTepyfZYuWT75xSVIXWRgHyfFdAD59gnA
 ayR/PNS4S6edanEbQUcs+RKj4pFl+i8HMR/Wpc9ULqypgFe9tKtrxvw0W8drzsnVFjaT
 06MWYv/crvuw+grG0lk54llyeOdibsCvxqGpjkSoPgIu51a4NBJuf8oJffLeu9nHWgb/
 7YWw==
X-Gm-Message-State: AOAM533tw4usoMlxXw+0bqanUlFnYwLjQzW8HxzujKySzduV1GIrRZJX
 SpXVdhqVdicqqJP8I3ROd699Vmd8/z7WzQ==
X-Google-Smtp-Source: ABdhPJz/uaoGAS5YWNepVNhd+qI9FEZQoovPOeRinCilOF8oTvZhXjcN0GCoq4mHzXqPeYQENoyadA==
X-Received: by 2002:a62:2e45:: with SMTP id u66mr22488619pfu.121.1596985889720; 
 Sun, 09 Aug 2020 08:11:29 -0700 (PDT)
Received: from [192.168.86.81] ([49.206.15.28])
 by smtp.gmail.com with ESMTPSA id w82sm19869911pff.7.2020.08.09.08.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2020 08:11:29 -0700 (PDT)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200806094440.14962-1-98.arpi@gmail.com>
 <20200806100540.GE3703480@smile.fi.intel.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <caf314b0-c090-26e6-3593-cb23aab1cbe3@gmail.com>
Date: Sun, 9 Aug 2020 20:41:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806100540.GE3703480@smile.fi.intel.com>
Content-Language: en-US
Cc: brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_hexdump.c to
	KUnit
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

On 06/08/20 3:35 pm, Andy Shevchenko wrote:
> On Thu, Aug 06, 2020 at 03:14:40PM +0530, Arpitha Raghunandan wrote:
>> Converts test lib/test_hexdump.c to KUnit.
>> More information about KUnit can be found at
>> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
>> KUnit provides a common framework for unit tests in the kernel.
> 
> ...
> 
>> -	if (memcmp(test, real, TEST_HEXDUMP_BUF_SIZE)) {
>> -		pr_err("Len: %zu row: %d group: %d\n", len, rowsize, groupsize);
>> -		pr_err("Result: '%s'\n", real);
>> -		pr_err("Expect: '%s'\n", test);
>> -		failed_tests++;
>> -	}
>> +	KUNIT_EXPECT_EQ(kunittest, 0, memcmp(test, real, TEST_HEXDUMP_BUF_SIZE));
> 
> 
> Ah, can you explain how user will see now what is being expected and what is in
> reality in the buffer? I'm not gonna accept such changes without showing in
> explicitly that user is not going to suffer of this change.
> 
I have sent another patch replacing KUNIT_EXPECT_EQ() with KUNIT_EXPECT_EQ_MSG() and KUNIT_EXPECT_NE() with KUNIT_EXPECT_NE_MSG(). These methods log what is being expected and what is in reality in the buffer in case of test failure similar to the original test.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
