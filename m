Return-Path: <SRS0=z0fH=5Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBD8C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 18:35:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B104120784
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 18:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="eZaUbKqB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B104120784
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 707308890A;
	Tue, 31 Mar 2020 18:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YE9VHnxrzFga; Tue, 31 Mar 2020 18:35:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E2275888FD;
	Tue, 31 Mar 2020 18:35:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C23CCC1AE2;
	Tue, 31 Mar 2020 18:35:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09774C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 18:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EAAF224E83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 18:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMZobKS4Gajp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 18:35:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 0E41720015
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 18:35:44 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id e4so19804740oig.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zLVDD+NzMHaNk3lT9nXy779lPxGGvFl1BeZrYwA43Fw=;
 b=eZaUbKqBQsAGEDWohcgVWreqYFpuy1mtBi8+zOZFx4hKtYXVoodnXBRoqO5ffqHmyJ
 s+TE9G2H7Wez9Qr9x1vq0LGjzrhad/x5PKrJ1+UMhBbOBxRBDX7ry0dL3vIHj1k75YVv
 7NqwAL+5p8OUn3W7fOUI219Glds7agiAj/hLMgByUGeC2b9+fW2EpYPyKoQw6c1z9g3U
 KtK6Ia2Gx7k5g6CjE4Kc2Bo18fYpsJSHTS25OlRYlqeE/r4+8wLTDR9rmVMqcQ6Y2JtF
 sUNYHN8gSJS9S2L1MfGM/RZnGtHHdFTIfnHnyhceOUiyeOifHVSMKIDrD/KANnLQ7Th5
 O28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zLVDD+NzMHaNk3lT9nXy779lPxGGvFl1BeZrYwA43Fw=;
 b=qFCYHWekR+JZ6YNGdbhEqglrTMsXkNAglRME/k+DCiwmLoAtcv9A150aZIw0eElqBk
 D3kd/WiJzmxLcZUEkX3ftVXMuscveau7jYkuq+YtGzE24VZlVKof2UUI7oZwMTuhRDa5
 OWwR45No1YWiqP7By+A/TIMy+Hpj2bHd7109W77K+imAZW8klUJ1zC2sC9KkiWnN8xAf
 CVSt9dORktc2l/URZR2VbZkBDLtmsXkEr+++Aq0lAHY4C4TTwPxVvHbiEUgjoDtaA98D
 g8M557yG6AEHqd1z+8QZcPSFWZtNa6IAG0Wstst9XcBb3dYTzK4U7I3FpFflPmBgKbbl
 dggQ==
X-Gm-Message-State: AGi0PubC9KpRD0HullFrGKEdghOAuCBxg35zDPqpO/AssUhi5ab9Wzd4
 Bxsn3piBopXt6wlRameFYEGe5vp0YfbIgKpmyNV59LYYKWM=
X-Google-Smtp-Source: APiQypI7iAE735GgCKkeZusjs8UlrOmYraVum5tmyZ7a9ZtEskbpvk2jByn4JUjxs7U3xgaqUrYxkZIAf+J/001kv4E=
X-Received: by 2002:a17:90a:9f03:: with SMTP id n3mr209849pjp.29.1585679249825; 
 Tue, 31 Mar 2020 11:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200330230256.28323-1-vitor@massaru.org>
In-Reply-To: <20200330230256.28323-1-vitor@massaru.org>
Date: Tue, 31 Mar 2020 11:27:18 -0700
Message-ID: <CAFd5g47hiPf7Xy0f4YER+HzHHXyUV0dhiQ=2ZXfezEHBcrTuEQ@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kunit: Fix kunit.py run
 --build_dir='<foo>' fails on "unclean" trees
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

On Mon, Mar 30, 2020 at 4:03 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Fix this bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
>
> For some reason, the environment variable ARCH is used instead of ARCH
> passed as an argument, this patch uses a copy of the env, but using
> ARCH=um and CROSS_COMPILER='' to avoid this problem.
>
> This patch doesn't change the user's environment variables, avoiding
> side effects.

Seems reasonable to me.

> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

I cannot test this as your patch doesn't apply to our for-next branch
(kselftest/kunit). You can find it here:

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=kunit

> ---
>  tools/testing/kunit/kunit_kernel.py | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
> index d99ae75ef72f..0cb1f81ac8f2 100644
> --- a/tools/testing/kunit/kunit_kernel.py
> +++ b/tools/testing/kunit/kunit_kernel.py
> @@ -15,6 +15,7 @@ import kunit_config
>
>  KCONFIG_PATH = '.config'
>  kunitconfig_path = '.kunitconfig'
> +env = dict(os.environ.copy(), ARCH='um', CROSS_COMPILE='')
>
>  class ConfigError(Exception):
>         """Represents an error trying to configure the Linux kernel."""
> @@ -36,22 +37,22 @@ class LinuxSourceTreeOperations(object):
>                         raise ConfigError(e.output)
>
>         def make_olddefconfig(self, build_dir):
> -               command = ['make', 'ARCH=um', 'olddefconfig']
> +               command = ['make', 'olddefconfig']
>                 if build_dir:
>                         command += ['O=' + build_dir]
>                 try:
> -                       subprocess.check_output(command)
> +                       subprocess.check_output(command, env=env)
>                 except OSError as e:
>                         raise ConfigError('Could not call make command: ' + e)
>                 except subprocess.CalledProcessError as e:
>                         raise ConfigError(e.output)
>
>         def make(self, jobs, build_dir):
> -               command = ['make', 'ARCH=um', '--jobs=' + str(jobs)]
> +               command = ['make', '--jobs=' + str(jobs)]
>                 if build_dir:
>                         command += ['O=' + build_dir]
>                 try:
> -                       subprocess.check_output(command)
> +                       subprocess.check_output(command, env=env)
>                 except OSError as e:
>                         raise BuildError('Could not call execute make: ' + e)
>                 except subprocess.CalledProcessError as e:
> @@ -66,7 +67,8 @@ class LinuxSourceTreeOperations(object):
>                         [linux_bin] + params,
>                         stdin=subprocess.PIPE,
>                         stdout=subprocess.PIPE,
> -                       stderr=subprocess.PIPE)
> +                       stderr=subprocess.PIPE,
> +                       env=env)
>                 process.wait(timeout=timeout)
>                 return process
>
> --
> 2.21.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
