Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF5FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 10:23:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 365032075B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 10:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="rL9s269p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 365032075B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F3513883E2;
	Thu, 27 Aug 2020 10:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pruCqpWt-66W; Thu, 27 Aug 2020 10:23:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56F01883E1;
	Thu, 27 Aug 2020 10:23:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4155FC07FF;
	Thu, 27 Aug 2020 10:23:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF739C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 10:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EB4F2041F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 10:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xse929mjYyWi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 10:23:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 4D20A20405
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 10:23:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c18so298517wrm.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0vdvNJDaA2R7UXSkN77bjSvK1qeX8JyEc0qDlajxxQs=;
 b=rL9s269pC6oLPkDI3tfzuJ3tZopAeQgT12ll7VhkWMrh63n8tMcGzsY2JpzvUyY+2V
 BnJoTVPMzTTKxL2ZYBqaJb/jvPfj/1afWfg89ZMHpUb3Svwd6G3PRT3EnIhj9OvUMJ54
 ookJUfCmWVwiMG/53gmkqcqX5C6OZjjwKAMZzpAvBtwBJ86bjd7HemRjxRpSGfSLmA9i
 qXBv62SNbammdu2urTkc3+B87Y8ZtDUgCFBF7f6yzegW6wqTA5QKgw2GxtxNTbWOZDaB
 9Caq/5XYLKnqKdOMzAiYdzHptBi95kgEr3utkviH2i+wTx5Qa3VoZmWOBbPe1L/dNfiI
 VaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0vdvNJDaA2R7UXSkN77bjSvK1qeX8JyEc0qDlajxxQs=;
 b=oaSZKOTYF6zXmk62mFi0upmKJBif1TlOJU8GWCbalDHzqT5fVfrL9n6z2HnRDdMhiG
 8r7s1efhAUXLCg5QpXPfBlJ5bTSqXWZmCbvFbUoCLHfbC6HycbUZBE7v8GVq96F9FbzE
 7A+OMosoYqmbiybKO8YAGNTd2J3sSkYw8Ty9ty5B1/4I/lgVm2EQNsg1t87QnYSA5JzK
 moof10ecZIDG8BR/U8YMk7sT1m7zvntLfc1s3CXf+2zqH/OEJ5ms9GCfTXruo81lAygU
 WP14kvK1dTO5wzxtfkNnaO8NH1fMZ15jLm9zBrvJzW8ybmoeZ2mbMdNIyMla8VnsVi4u
 s6Ig==
X-Gm-Message-State: AOAM5327OqtJxNJhnKFk2L1ND5tcWvQBGPAx7d9ZpUWlb8BAcfh3ms34
 Ajo7u5PSDvuihmIg/yNMVbid/g==
X-Google-Smtp-Source: ABdhPJyoJ9GbQB398A5GCtwxbatRdwlRJ0T5rbxABDfukLqBP6BMHFxbSgZX80fPQmQT5e64awRLCQ==
X-Received: by 2002:adf:a48d:: with SMTP id g13mr3444805wrb.212.1598523819563; 
 Thu, 27 Aug 2020 03:23:39 -0700 (PDT)
Received: from elver.google.com ([100.105.32.75])
 by smtp.gmail.com with ESMTPSA id k13sm4157086wmj.14.2020.08.27.03.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:23:38 -0700 (PDT)
Date: Thu, 27 Aug 2020 12:23:33 +0200
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20200827102333.GA3564678@elver.google.com>
References: <20200729192357.477350-1-vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729192357.477350-1-vitor@massaru.org>
User-Agent: Mutt/1.14.4 (2020-06-18)
Cc: mhocko@suse.com, arnd@arndb.de, torvalds@linux-foundation.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 elfring@users.sourceforge.net, paul.gortmaker@windriver.com,
 geert@linux-m68k.org, linux-kselftest@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com,
 linux-kernel-mentees@lists.linuxfoundation.org, akpm@linux-foundation.org,
 kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: add list_sort test
	conversion to KUnit
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jul 29, 2020 at 04:23PM -0300, Vitor Massaru Iha wrote:
> This adds the conversion of the runtime tests of test_list_sort,
> from `lib/test_list_sort.c` to KUnit tests.
> 
> Please apply this commit first (linux-kselftest/kunit-fixes):
> 3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space
> 
> Code Style Documentation: [0]
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Link: [0] https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u
> ---
>  lib/Kconfig.debug                           | 29 +++++---
>  lib/Makefile                                |  2 +-
>  lib/{test_list_sort.c => list_sort_kunit.c} | 73 +++++++++++----------
>  3 files changed, 58 insertions(+), 46 deletions(-)
>  rename lib/{test_list_sort.c => list_sort_kunit.c} (62%)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9ad9210d70a1..de4fd020a4af 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1854,16 +1854,6 @@ config LKDTM
>  	Documentation on how to use the module can be found in
>  	Documentation/fault-injection/provoke-crashes.rst
>  
> -config TEST_LIST_SORT
> -	tristate "Linked list sorting test"
> -	depends on DEBUG_KERNEL || m
> -	help
> -	  Enable this to turn on 'list_sort()' function test. This test is
> -	  executed only once during system boot (so affects only boot time),
> -	  or at module load time.
> -
> -	  If unsure, say N.
> -
>  config TEST_MIN_HEAP
>  	tristate "Min heap test"
>  	depends on DEBUG_KERNEL || m
> @@ -2173,6 +2163,25 @@ config LIST_KUNIT_TEST
>  
>  	  If unsure, say N.
>  
> +config LIST_SORT_KUNIT
> +	tristate "KUnit Linked list sorting test"
> +	depends on KUNIT
> +	depends on DEBUG_KERNEL || m

I think the style [0] you linked suggests '*_KUNIT_TEST' for config
variables.

Only noticed this because I was doing a
	
	git grep 'config.*TEST'

to find tests in the kernel + new tests floating on the LKML.

Apologies for picking this patch to comment on, but if it's still
changeable it might be worth adjusting.

> +	help
> +	  Enable this to turn on 'list_sort()' function test. This test is
> +	  executed only once during system boot (so affects only boot time),
> +	  or at module load time.
> +
> +          KUnit tests run during boot and output the results to the debug log
> +	  in TAP format (http://testanything.org/). Only useful for kernel devs
> +	  running the KUnit test harness, and not intended for inclusion into a
> +	  production build.

Not a big deal, but I'm not sure if summarizing KUnit here is useful.
You already link to the documentation below.

> +	  For more information on KUnit and unit tests in general please refer
> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.
...

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
