Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1BCC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 18:35:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4407C21531
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 18:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4407C21531
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BBC986B8E;
	Wed, 21 Oct 2020 18:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBhUiCtGUoVc; Wed, 21 Oct 2020 18:35:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 537D086B8D;
	Wed, 21 Oct 2020 18:35:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D37BC08A1;
	Wed, 21 Oct 2020 18:35:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09678C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EB57C87653
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-oYWFFOsnAb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:35:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0169.hostedemail.com
 [216.40.44.169])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E793987617
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:35:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id CDAE918224D70;
 Wed, 21 Oct 2020 18:35:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: air39_5f006092724a
X-Filterd-Recvd-Size: 5767
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Wed, 21 Oct 2020 18:35:25 +0000 (UTC)
Message-ID: <3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nick Desaulniers
 <ndesaulniers@google.com>, lukas.bulwahn@gmail.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, dwaipayanray1@gmail.com,
 Aditya <yashsri421@gmail.com>
Date: Wed, 21 Oct 2020 11:35:23 -0700
In-Reply-To: <CANiq72m+_QYtn_1gyrjXFs6yeDdiMoS4DVcWqYcTgyCFnSFXbw@mail.gmail.com>
References: <20200629003127.GB5535@shao2-debian>
 <20200630124628.GV4817@hirez.programming.kicks-ass.net>
 <20200630144905.GX4817@hirez.programming.kicks-ass.net>
 <58ff47cc-dc55-e383-7a5b-37008d145aba@gmail.com>
 <20201021080031.GY2628@hirez.programming.kicks-ass.net>
 <20201021131806.GA2176@tucnak>
 <20201021134436.GJ2628@hirez.programming.kicks-ass.net>
 <CAKwvOd=qi63We=6rLapb565giCVe-8a6d=-=3VZL6RWzhwAeZg@mail.gmail.com>
 <CANiq72m+_QYtn_1gyrjXFs6yeDdiMoS4DVcWqYcTgyCFnSFXbw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Jakub Jelinek <jakub@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, kernel test robot <lkp@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND
 64-BIT\)" <x86@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 LKP <lkp@lists.01.org>, linux-toolchains@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Subject: Re: [Linux-kernel-mentees] GCC section alignment,
	and GCC-4.9 being a weird one
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

(adding cc's of kernel-mentees and a few checkpatch contributors)

On Wed, 2020-10-21 at 19:54 +0200, Miguel Ojeda wrote:
> On Wed, Oct 21, 2020 at 7:42 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > If you used some of the macros from
> > include/linux/compiler_attributes.h like __section and __aligned, I
> > would prefer it.  Please consider spelling out __attribute__(()) an
> > antipattern.
> 
> +1, the shorthands should be used unless there is a reason not to (and
> please write the reason in a comment in that case).

Perhaps something to add as a generic test in checkpatch.

Right now it checks separately for each __attribute__
use with any of aligned, section, printf and scanf.

Likely it should include more of the #defines from
include/linux/compiler_attributes.h.

include/linux/compiler_attributes.h:#define __alias(symbol)                 __attribute__((__alias__(#symbol)))
include/linux/compiler_attributes.h:#define __aligned(x)                    __attribute__((__aligned__(x)))
include/linux/compiler_attributes.h:#define __aligned_largest               __attribute__((__aligned__))
include/linux/compiler_attributes.h:#define __always_inline                 inline __attribute__((__always_inline__))
include/linux/compiler_attributes.h:# define __assume_aligned(a, ...)       __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))
include/linux/compiler_attributes.h:#define __cold                          __attribute__((__cold__))
include/linux/compiler_attributes.h:#define __attribute_const__             __attribute__((__const__))
include/linux/compiler_attributes.h:# define __copy(symbol)                 __attribute__((__copy__(symbol)))
include/linux/compiler_attributes.h:# define __designated_init              __attribute__((__designated_init__))
include/linux/compiler_attributes.h:# define __visible                      __attribute__((__externally_visible__))
include/linux/compiler_attributes.h:#define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
include/linux/compiler_attributes.h:#define __scanf(a, b)                   __attribute__((__format__(scanf, a, b)))
include/linux/compiler_attributes.h:#define __gnu_inline                    __attribute__((__gnu_inline__))
include/linux/compiler_attributes.h:#define __malloc                        __attribute__((__malloc__))
include/linux/compiler_attributes.h:#define __mode(x)                       __attribute__((__mode__(x)))
include/linux/compiler_attributes.h:# define __no_caller_saved_registers        __attribute__((__no_caller_saved_registers__))
include/linux/compiler_attributes.h:# define __noclone                      __attribute__((__noclone__))
include/linux/compiler_attributes.h:# define fallthrough                    __attribute__((__fallthrough__))
include/linux/compiler_attributes.h:#define   noinline                      __attribute__((__noinline__))
include/linux/compiler_attributes.h:# define __nonstring                    __attribute__((__nonstring__))
include/linux/compiler_attributes.h:#define __noreturn                      __attribute__((__noreturn__))
include/linux/compiler_attributes.h:#define __packed                        __attribute__((__packed__))
include/linux/compiler_attributes.h:#define __pure                          __attribute__((__pure__))
include/linux/compiler_attributes.h:#define __section(S)                    __attribute__((__section__(#S)))
include/linux/compiler_attributes.h:#define __always_unused                 __attribute__((__unused__))
include/linux/compiler_attributes.h:#define __maybe_unused                  __attribute__((__unused__))
include/linux/compiler_attributes.h:#define __used                          __attribute__((__used__))
include/linux/compiler_attributes.h:#define __weak                          __attribute__((__weak__))


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
