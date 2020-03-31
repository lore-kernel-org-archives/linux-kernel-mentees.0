Return-Path: <SRS0=z0fH=5Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388B8C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 19:45:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D31BC2080C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 19:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="i3NpJnHq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D31BC2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B375C87EB0;
	Tue, 31 Mar 2020 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7nt3DiB6Yvqq; Tue, 31 Mar 2020 19:45:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D8CC187A3D;
	Tue, 31 Mar 2020 19:45:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C30EAC1AE8;
	Tue, 31 Mar 2020 19:45:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 600EFC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 19:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5C0F286D3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 19:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zw6JgCeRVfXZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 19:45:30 +0000 (UTC)
X-Greylist: delayed 00:06:22 by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C51586D2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 19:45:30 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id a5so8294331ybo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 12:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CmyCyWagylfuKeKB4BO2p4EHeCrzlGpSPlijLTrzQrE=;
 b=i3NpJnHq4kSwxmmk+3rXgxdW8Wt5LW4Edf8xpVA/myZ6FFGqWy/Sa+cGk5maohkOQg
 y8WPF8b84LcU2zQHXVM70zuqSL6ixG4qKmAdHZshTqzvgvpH3/x4nny6bJrgYirLw/Xt
 e+VOU9zfivBrm990mM3EWL29oUt2b6LNVZQEWsmCGkYJhexuUp9A0JbWWyxZM/vQkx03
 tzyBPfueZyGMUmSjzf8LtNpzxWmqXsIIpiCLUk7f/1CEBepL5tBomiR3cob+FkM33OPo
 RQSd9hB1ceYDCHxgX2JI6Y03S00SeRYbcs6RihoC5/E9NC8F49Un2sMHlO+AzuTxlQUa
 PcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CmyCyWagylfuKeKB4BO2p4EHeCrzlGpSPlijLTrzQrE=;
 b=O8xKspTBoCtLWMhdpHdtUAxnOUAhfRn0/wEMtGQz9NK5PPtMvSNEDntrbSdd88dmfc
 rhj8jojEYlxF2AQ0d1z8pWd8qV7Ex3ldhftDA861GtgYgTbE9q/qI6IpuS43saFCsxVL
 IkRwuZzWP5AWFc+qIABjJNrxp8VhGmIAmMIygfZf/Y1WiF4hHdpGAYI2Qay2Ev7zqfvI
 bpBRQnaVYfYiAz2PtCm3ZpSuW4CmkjmWRcKFWDZOUfBfCqrQdUeShAqOkYn43qRzLMR2
 oeJNa5yloRe9OgcuxRMMw420dgo4PCJlA62XCLmhnuGzaQ+9JaxfaPl5XRnshHvEIZXd
 j0Ww==
X-Gm-Message-State: ANhLgQ2ycDmsN/iwgw7/btV9siFu9bbGN3VfLmv8hZ3Ad2QmUUcjENmW
 L9NOx99Z4E0LevuosAin0ECB9nrgedw+GOrW1IFhSZTSdUrIQg==
X-Google-Smtp-Source: ADFU+vtC9v29cwTvgQzCRkzqmplSAGo2pfpyc7gBVxRCNiuU28PdpgwpW/Ke6FkwW6/6YGQT2lEDfhOzwI5e3wgwWTc=
X-Received: by 2002:a25:c482:: with SMTP id
 u124mr31079143ybf.286.1585683547417; 
 Tue, 31 Mar 2020 12:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200330230256.28323-1-vitor@massaru.org>
 <CAFd5g47hiPf7Xy0f4YER+HzHHXyUV0dhiQ=2ZXfezEHBcrTuEQ@mail.gmail.com>
In-Reply-To: <CAFd5g47hiPf7Xy0f4YER+HzHHXyUV0dhiQ=2ZXfezEHBcrTuEQ@mail.gmail.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Tue, 31 Mar 2020 16:38:30 -0300
Message-ID: <CADQ6JjUUFsJdgeLNA8XUkSF14H=WWF8y2eNTvQPNXHRQ+p_qBw@mail.gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Brendan,

On Tue, Mar 31, 2020 at 3:27 PM 'Brendan Higgins' via KUnit
Development <kunit-dev@googlegroups.com> wrote:
>
> On Mon, Mar 30, 2020 at 4:03 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
> >
> > Fix this bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> >
> > For some reason, the environment variable ARCH is used instead of ARCH
> > passed as an argument, this patch uses a copy of the env, but using
> > ARCH=um and CROSS_COMPILER='' to avoid this problem.
> >
> > This patch doesn't change the user's environment variables, avoiding
> > side effects.
>
> Seems reasonable to me.

There are other problems here, I'll fix it.

>
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
>
> I cannot test this as your patch doesn't apply to our for-next branch
> (kselftest/kunit). You can find it here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=kunit
>
> > ---
> >  tools/testing/kunit/kunit_kernel.py | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
> > index d99ae75ef72f..0cb1f81ac8f2 100644
> > --- a/tools/testing/kunit/kunit_kernel.py
> > +++ b/tools/testing/kunit/kunit_kernel.py
> > @@ -15,6 +15,7 @@ import kunit_config
> >
> >  KCONFIG_PATH = '.config'
> >  kunitconfig_path = '.kunitconfig'
> > +env = dict(os.environ.copy(), ARCH='um', CROSS_COMPILE='')
> >
> >  class ConfigError(Exception):
> >         """Represents an error trying to configure the Linux kernel."""
> > @@ -36,22 +37,22 @@ class LinuxSourceTreeOperations(object):
> >                         raise ConfigError(e.output)
> >
> >         def make_olddefconfig(self, build_dir):
> > -               command = ['make', 'ARCH=um', 'olddefconfig']
> > +               command = ['make', 'olddefconfig']
> >                 if build_dir:
> >                         command += ['O=' + build_dir]
> >                 try:
> > -                       subprocess.check_output(command)
> > +                       subprocess.check_output(command, env=env)
> >                 except OSError as e:
> >                         raise ConfigError('Could not call make command: ' + e)
> >                 except subprocess.CalledProcessError as e:
> >                         raise ConfigError(e.output)
> >
> >         def make(self, jobs, build_dir):
> > -               command = ['make', 'ARCH=um', '--jobs=' + str(jobs)]
> > +               command = ['make', '--jobs=' + str(jobs)]
> >                 if build_dir:
> >                         command += ['O=' + build_dir]
> >                 try:
> > -                       subprocess.check_output(command)
> > +                       subprocess.check_output(command, env=env)
> >                 except OSError as e:
> >                         raise BuildError('Could not call execute make: ' + e)
> >                 except subprocess.CalledProcessError as e:
> > @@ -66,7 +67,8 @@ class LinuxSourceTreeOperations(object):
> >                         [linux_bin] + params,
> >                         stdin=subprocess.PIPE,
> >                         stdout=subprocess.PIPE,
> > -                       stderr=subprocess.PIPE)
> > +                       stderr=subprocess.PIPE,
> > +                       env=env)
> >                 process.wait(timeout=timeout)
> >                 return process
> >
> > --
> > 2.21.1
> >
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/CAFd5g47hiPf7Xy0f4YER%2BHzHHXyUV0dhiQ%3D2ZXfezEHBcrTuEQ%40mail.gmail.com.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
