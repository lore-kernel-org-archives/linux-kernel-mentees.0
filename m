Return-Path: <SRS0=9a3k=5X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0060C2D0EC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Apr 2020 20:38:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7355D2074B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Apr 2020 20:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="a0fZT4bK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7355D2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C89C816E6;
	Tue,  7 Apr 2020 20:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZA3fggQztf1; Tue,  7 Apr 2020 20:38:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58E30815E8;
	Tue,  7 Apr 2020 20:38:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 419F6C1AE2;
	Tue,  7 Apr 2020 20:38:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F93CC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Apr 2020 20:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 39971863FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Apr 2020 20:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hI0Va4Po71tB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Apr 2020 20:38:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4CA3584FB3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Apr 2020 20:38:43 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q204so2711894oia.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Apr 2020 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zKqZWyMQ8V8zQ20un6jU7HEK04ADqKGnxMMnNcQmdRY=;
 b=a0fZT4bKGAAC/shPL7O9e0uWZrLTjV2ylyJY2sfBmRY6B5ZvfW0dghucSOrpamWJPY
 JUCYKHnWorr9tUamq/iR4giSU6tjk4oCiShBGmL782UKl0DWVLzfSxGttgdlmHeSMD8n
 USEybio2T7VuUT2fLczo63Ru53sMFCVzfTlT+mU1Fa/ap6GWDg2VcjCg86jjpviYRHXc
 Iz7So5F7Udpr9Lbhc79nVirD0nmXaF25Itbm1mm1GG9t2QNB6iWyFMa5OAL092sfbgH8
 5AztG4ripU+6zZTSDZvgQZCVw8RocoC0t5NurWuTODsqnHquobk+085szhz7aVytbHti
 ZXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zKqZWyMQ8V8zQ20un6jU7HEK04ADqKGnxMMnNcQmdRY=;
 b=jhp67OeNtAWVjeSP5HGXGACdbtzqwXY/us8MPnr+AWK9Ujo2kls1RpPnL6A7togUhk
 cCXLVxkguzQeA1z+swyGa04Lj61fdji40uH+r8UV3kY2E5K/S0j1Na75WnTOdTGes5FN
 xBOWI5jNkTIJ2wsbXEd+cC5xq0mP1T4ImghtQsGxi+c0iIAYFPWH3i2TCyPRvcOpcZpo
 F6z2YGKW4MpdBBTWTMiXK7majtRprxH8z/vQIeMn3vqx3FLgu4GDVnnZ2X4H3rYdpdhA
 0adogtDt4xgNO5WvqlqJaF4O/WcbT9kDdsNIoR0P9Gc388dCBQ+wjho6pZBeut0gqr4M
 coFw==
X-Gm-Message-State: AGi0PuZmISWFa4vQHb+P+CQt8ogNond61erdysno/TU03aUKnTWAZrAF
 J8Q/Xa2tpEfIu5829ObfPMMXwExhNJgcJ0fFbghtDNab2dE=
X-Google-Smtp-Source: APiQypKi0NHL1kvG+6WjCjMqalM7lL+WN8MrRtbStR3FlzJY1khKq++r7+B0jHFKqM7izTL5ggeQhNjpij2BSWIXUw4=
X-Received: by 2002:a17:90a:30c3:: with SMTP id
 h61mr1246223pjb.18.1586291478614; 
 Tue, 07 Apr 2020 13:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200406221916.50008-1-vitor@massaru.org>
In-Reply-To: <20200406221916.50008-1-vitor@massaru.org>
Date: Tue, 7 Apr 2020 13:31:07 -0700
Message-ID: <CAFd5g44EGCY0zHfZXekS8GAXHxrf5zeeTW=MHRz0NujKqTsRQg@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3,
 RESEND] kunit: Fix kunit.py run --build_dir='<foo>' fails on
 "unclean" trees
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Apr 6, 2020 at 3:19 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Fix this bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219

I am still seeing the error described in the bug.

Steps to reproduce:

1. tools/testing/kunit/kunit.py run --timeout=60 --jobs=8 --defconfig

2. make ARCH=um mrproper

3. tools/testing/kunit/kunit.py run --timeout=60 --jobs=8 --defconfig
--build_dir=.kunit

One other note: It should probably be done in another patch, but it
would be nice if kunit.py would tell you that you need to run mrproper
when the olddefconfig fails.

> For some reason, the environment variable ARCH is used instead of ARCH
> passed as an argument, this patch uses a copy of the env, but using
> ARCH=um and CROSS_COMPILER='' to avoid this problem.
>
> This patch doesn't change the user's environment variables, avoiding
> side effects.
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
> v2:
>  - Use the correct next branch
>
> v3:
>  - Use torvalds/master branch
>  - Use base parameter on git send-email
> ---
>  tools/testing/kunit/kunit_kernel.py | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
> index 63dbda2d029f..96216c699fde 100644
> --- a/tools/testing/kunit/kunit_kernel.py
> +++ b/tools/testing/kunit/kunit_kernel.py
> @@ -20,6 +20,7 @@ import kunit_parser
>  KCONFIG_PATH = '.config'
>  kunitconfig_path = '.kunitconfig'
>  BROKEN_ALLCONFIG_PATH = 'tools/testing/kunit/configs/broken_on_uml.config'
> +env = dict(os.environ.copy(), ARCH='um', CROSS_COMPILE='')
>
>  class ConfigError(Exception):
>         """Represents an error trying to configure the Linux kernel."""
> @@ -41,13 +42,15 @@ class LinuxSourceTreeOperations(object):
>                         raise ConfigError(e.output)
>
>         def make_olddefconfig(self, build_dir, make_options):
> -               command = ['make', 'ARCH=um', 'olddefconfig']
> +               command = ['make', 'olddefconfig']
>                 if make_options:
>                         command.extend(make_options)
>                 if build_dir:
>                         command += ['O=' + build_dir]
>                 try:
> -                       subprocess.check_output(command, stderr=subprocess.PIPE)
> +                       subprocess.check_output(command,
> +                                               stderr=subprocess.PIPE,
> +                                               env=env)
>                 except OSError as e:
>                         raise ConfigError('Could not call make command: ' + e)
>                 except subprocess.CalledProcessError as e:
> @@ -57,9 +60,10 @@ class LinuxSourceTreeOperations(object):
>                 kunit_parser.print_with_timestamp(
>                         'Enabling all CONFIGs for UML...')
>                 process = subprocess.Popen(
> -                       ['make', 'ARCH=um', 'allyesconfig'],
> +                       ['make', 'allyesconfig'],
>                         stdout=subprocess.DEVNULL,
> -                       stderr=subprocess.STDOUT)
> +                       stderr=subprocess.STDOUT,
> +                       env=env)
>                 process.wait()
>                 kunit_parser.print_with_timestamp(
>                         'Disabling broken configs to run KUnit tests...')
> @@ -71,13 +75,13 @@ class LinuxSourceTreeOperations(object):
>                         'Starting Kernel with all configs takes a few minutes...')
>
>         def make(self, jobs, build_dir, make_options):
> -               command = ['make', 'ARCH=um', '--jobs=' + str(jobs)]
> +               command = ['make', '--jobs=' + str(jobs)]
>                 if make_options:
>                         command.extend(make_options)
>                 if build_dir:
>                         command += ['O=' + build_dir]
>                 try:
> -                       subprocess.check_output(command)
> +                       subprocess.check_output(command, env=env)
>                 except OSError as e:
>                         raise BuildError('Could not call execute make: ' + e)
>                 except subprocess.CalledProcessError as e:
> @@ -91,7 +95,8 @@ class LinuxSourceTreeOperations(object):
>                 with open(outfile, 'w') as output:
>                         process = subprocess.Popen([linux_bin] + params,
>                                                    stdout=output,
> -                                                  stderr=subprocess.STDOUT)
> +                                                  stderr=subprocess.STDOUT,
> +                                                  env=env)
>                         process.wait(timeout)
>
>
>
> base-commit: 7e63420847ae5f1036e4f7c42f0b3282e73efbc2
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
