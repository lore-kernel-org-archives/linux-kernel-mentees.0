Return-Path: <SRS0=9a3k=5X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35379C2D0EC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Apr 2020 21:38:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB72D20730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Apr 2020 21:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="Hfwezzhc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB72D20730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9399A87E09;
	Tue,  7 Apr 2020 21:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T+0A0FPGCk50; Tue,  7 Apr 2020 21:38:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D4FFE85055;
	Tue,  7 Apr 2020 21:38:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1784C1D7E;
	Tue,  7 Apr 2020 21:38:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 388BAC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Apr 2020 21:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 32680221A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Apr 2020 21:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5h7kRLM6-HI4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Apr 2020 21:38:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by silver.osuosl.org (Postfix) with ESMTPS id E768520035
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Apr 2020 21:38:52 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h14so1060757qke.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Apr 2020 14:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=isuLobyDtt6EFpFjL8LiFOi1CRIfA1D/367XhIHg364=;
 b=HfwezzhcKfEVjhsWnYuE+MOwB43m0F5LU/ypxx0eZ+y229VT2wHow55nM/MWJvF7vE
 KDxFReBiJci6sow5QVNmADUlPNOsA8JJ04CYmAGy1rLGLxLBmnmOysRFqAccjr+sz8cu
 QR8nuPXJgsqHD/luOvmgr3Dmmr2fiEpx+H568cGpnWCeYP2eR1TQ4E+6CFoby2MED4ky
 QFZLNyxOQOK/qxeoPO1eNN+B78irxg01lKJtBw1Az8KfaFbnhabIXtb0fNi1iGtLZ3hQ
 UDo7nq1z6RseGH/V02uty5ZxA7yt9Z4CLaaFcORe+sxANwbM/txD6UvmELaWWa9JowuR
 jflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=isuLobyDtt6EFpFjL8LiFOi1CRIfA1D/367XhIHg364=;
 b=ZvqEXHYLOHaSOp2vY7RHrUZO+AludHXJBFnFS+9rcXHsNMDsyR7jmyB36irAKkbSn1
 Xc0ZECOG7Jgj9difn18zoSTafrA8nvCAyi7BekRVx40LGii4p1w8YK76eGvARfbC8vF8
 ctiYyiNqU4w/A6DT1j/COSY+bfiPhph4sAbFE26Otw/TMhPT1qTDxW7/rvlfYTfeX0ZF
 D41X1gpjwn89rzi7lMGFNXI8KXSlmgiqXDsy0D/i1aUM9JTrtQOsHooQ9TQqkYRcRf5+
 yLyLIctBzpB9KCbMr9dhtmKsLoU/auPlPXuSwGxLbNhwGpSjkmJ9OtOWPehCDjIcubSd
 hWtg==
X-Gm-Message-State: AGi0PuaCCWX9jcE60E17RGLJKrT7XuMTmTC2NQAandqFTu//XqQNQdUQ
 XfM2UByBO0nxAoUiX/9KbgAF0g==
X-Google-Smtp-Source: APiQypL9AU+nfBTB36SMyId+ZGOO1XL78KfsEhAHnGSpMqGnUwgpqsUAfmwwldXnBPU3DakKXJm/uA==
X-Received: by 2002:a37:8044:: with SMTP id b65mr4457520qkd.238.1586295531751; 
 Tue, 07 Apr 2020 14:38:51 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id p38sm18811316qtf.50.2020.04.07.14.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 14:38:51 -0700 (PDT)
Message-ID: <0d7d447764a67536885f38b032f888e91db43997.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 07 Apr 2020 18:38:48 -0300
In-Reply-To: <CAFd5g44EGCY0zHfZXekS8GAXHxrf5zeeTW=MHRz0NujKqTsRQg@mail.gmail.com>
References: <20200406221916.50008-1-vitor@massaru.org>
 <CAFd5g44EGCY0zHfZXekS8GAXHxrf5zeeTW=MHRz0NujKqTsRQg@mail.gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL
 SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Brendan,

On Tue, 2020-04-07 at 13:31 -0700, Brendan Higgins wrote:
> On Mon, Apr 6, 2020 at 3:19 PM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> > Fix this bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> 
> I am still seeing the error described in the bug.
> 
> Steps to reproduce:
> 
> 1. tools/testing/kunit/kunit.py run --timeout=60 --jobs=8 --defconfig
> 
> 2. make ARCH=um mrproper
> 
> 3. tools/testing/kunit/kunit.py run --timeout=60 --jobs=8 --defconfig
> --build_dir=.kunit

Thanks. I managed to reproduce the bug. I'm working on it.

> One other note: It should probably be done in another patch, but it
> would be nice if kunit.py would tell you that you need to run
> mrproper
> when the olddefconfig fails.

Sure, I can work on it.

> 
> > For some reason, the environment variable ARCH is used instead of
> > ARCH
> > passed as an argument, this patch uses a copy of the env, but using
> > ARCH=um and CROSS_COMPILER='' to avoid this problem.
> > 
> > This patch doesn't change the user's environment variables,
> > avoiding
> > side effects.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> > v2:
> >  - Use the correct next branch
> > 
> > v3:
> >  - Use torvalds/master branch
> >  - Use base parameter on git send-email
> > ---
> >  tools/testing/kunit/kunit_kernel.py | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tools/testing/kunit/kunit_kernel.py
> > b/tools/testing/kunit/kunit_kernel.py
> > index 63dbda2d029f..96216c699fde 100644
> > --- a/tools/testing/kunit/kunit_kernel.py
> > +++ b/tools/testing/kunit/kunit_kernel.py
> > @@ -20,6 +20,7 @@ import kunit_parser
> >  KCONFIG_PATH = '.config'
> >  kunitconfig_path = '.kunitconfig'
> >  BROKEN_ALLCONFIG_PATH =
> > 'tools/testing/kunit/configs/broken_on_uml.config'
> > +env = dict(os.environ.copy(), ARCH='um', CROSS_COMPILE='')
> > 
> >  class ConfigError(Exception):
> >         """Represents an error trying to configure the Linux
> > kernel."""
> > @@ -41,13 +42,15 @@ class LinuxSourceTreeOperations(object):
> >                         raise ConfigError(e.output)
> > 
> >         def make_olddefconfig(self, build_dir, make_options):
> > -               command = ['make', 'ARCH=um', 'olddefconfig']
> > +               command = ['make', 'olddefconfig']
> >                 if make_options:
> >                         command.extend(make_options)
> >                 if build_dir:
> >                         command += ['O=' + build_dir]
> >                 try:
> > -                       subprocess.check_output(command,
> > stderr=subprocess.PIPE)
> > +                       subprocess.check_output(command,
> > +                                               stderr=subprocess.P
> > IPE,
> > +                                               env=env)
> >                 except OSError as e:
> >                         raise ConfigError('Could not call make
> > command: ' + e)
> >                 except subprocess.CalledProcessError as e:
> > @@ -57,9 +60,10 @@ class LinuxSourceTreeOperations(object):
> >                 kunit_parser.print_with_timestamp(
> >                         'Enabling all CONFIGs for UML...')
> >                 process = subprocess.Popen(
> > -                       ['make', 'ARCH=um', 'allyesconfig'],
> > +                       ['make', 'allyesconfig'],
> >                         stdout=subprocess.DEVNULL,
> > -                       stderr=subprocess.STDOUT)
> > +                       stderr=subprocess.STDOUT,
> > +                       env=env)
> >                 process.wait()
> >                 kunit_parser.print_with_timestamp(
> >                         'Disabling broken configs to run KUnit
> > tests...')
> > @@ -71,13 +75,13 @@ class LinuxSourceTreeOperations(object):
> >                         'Starting Kernel with all configs takes a
> > few minutes...')
> > 
> >         def make(self, jobs, build_dir, make_options):
> > -               command = ['make', 'ARCH=um', '--jobs=' +
> > str(jobs)]
> > +               command = ['make', '--jobs=' + str(jobs)]
> >                 if make_options:
> >                         command.extend(make_options)
> >                 if build_dir:
> >                         command += ['O=' + build_dir]
> >                 try:
> > -                       subprocess.check_output(command)
> > +                       subprocess.check_output(command, env=env)
> >                 except OSError as e:
> >                         raise BuildError('Could not call execute
> > make: ' + e)
> >                 except subprocess.CalledProcessError as e:
> > @@ -91,7 +95,8 @@ class LinuxSourceTreeOperations(object):
> >                 with open(outfile, 'w') as output:
> >                         process = subprocess.Popen([linux_bin] +
> > params,
> >                                                    stdout=output,
> > -                                                  stderr=subproces
> > s.STDOUT)
> > +                                                  stderr=subproces
> > s.STDOUT,
> > +                                                  env=env)
> >                         process.wait(timeout)
> > 
> > 
> > 
> > base-commit: 7e63420847ae5f1036e4f7c42f0b3282e73efbc2
> > --
> > 2.25.1
> > 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
