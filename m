Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1ACC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 09:18:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76D120672
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 09:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76D120672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F57F87D65;
	Thu, 30 Jul 2020 09:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pbYxjDv0TBhw; Thu, 30 Jul 2020 09:18:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B486687D63;
	Thu, 30 Jul 2020 09:18:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8828FC004F;
	Thu, 30 Jul 2020 09:18:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D69AC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 09:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A44484B26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 09:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brluLIgU09Wv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 09:18:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 708B684789
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 09:18:25 +0000 (UTC)
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MGygv-1jwQ8r1pIJ-00E9UO for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Jul 2020 11:18:22
 +0200
Received: by mail-qt1-f174.google.com with SMTP id o22so19569644qtt.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 02:18:21 -0700 (PDT)
X-Gm-Message-State: AOAM532+p0kLWGfsH2lNCWAgODcglnBA5KAfeMc4AXr9hcThpM4Iujv6
 u27txctSoTJHk4yD75lSgbViTdT9YT4thUHyfCI=
X-Google-Smtp-Source: ABdhPJxTFkRhqtuLhXAsNUlZ9J0TZfkHL99w5pWpprWMX0g7dJ5QSuxxz8xtNYzXVB7FSGpCxdmyitm5GsMtlvmucAc=
X-Received: by 2002:aed:33e7:: with SMTP id v94mr1965217qtd.18.1596100700959; 
 Thu, 30 Jul 2020 02:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
 <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
 <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
 <20200730083833.GD3703480@smile.fi.intel.com>
In-Reply-To: <20200730083833.GD3703480@smile.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jul 2020 11:18:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
Message-ID: <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Provags-ID: V03:K1:lcO8QGGef0nMF7rKjitvRoMagyTrGJC8x/iS6laXyNkzKmoaSbf
 SCKpHINsKXjS56Gxk7atFADD8imhaUygPco09WWdvZgJwH3G/tsaY/gvwHWN/kl/42ID13G
 clLdU1Id1baRJtapmswPylLOiubxKjTOLZuz4QSmZCF6nVkFiD21lbKJpwFL+AY6el6E3Q6
 9lpvZdGnCIBne2oqjFsFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GMohn1DQvsg=:e0q3zcFTcN7E/QCtvCyI/T
 aJW6qe3FhcpYIDjzyGt+x7u2cK22r5EZiv794cQjlIASMhuiwadCjIclOK7FzNEQb1e+82ZWI
 JT9PWlf2yENJnlKs2Aw0R4PdPk4E3pjQ/Cs7XCnSktlo69pSiQO447qAwrd1+PqEZ6Tog2wn4
 P3hJuWfrDSjm1nIlEReebxxIOoN75ZqpYTjiqtHQCzXn6QsObwpSm3gwQjHRxUSqdTk8oOl+D
 oYhSj2DUbc00siD6n5qK+/aBqPJE+yldMFoTfUm72UIElf/wmKxjRX8V8VKEI/sCRf/ZeSo6D
 hEBDZojiz8sPehp2DNF0XQXOXGO/myGWGpqQkZdl9bknYOR8NitRFanbtUXqvJxGOgW2XkNgR
 KYwnQth8uSg7XYDsmYoEeB0KyslTcPI1LvddbwwyZo1FOce9tnvOxMp5wvEuyNHdhP5d1mgD7
 Tz+44ws7vqIiUK4jASnjWxUlWoRLgBqZkVKFyQ7on7+hV16d1Q5YsprUJZChAcvBlpwMoCh+x
 rJDANpz8mzTDne9ge8D5Bl5K6f0kwCoR+6je6ML54cyQ1JJnvXE+VEwFVhDTIC1uQSDBh9B0W
 Hz1cPJwb4CXRYShtyw2NAUBiajUiSetoN8DUviBb0hUxg+lWHxZZDNQQMBm61/PalBKkNHaO4
 NdS0nqK+sxHNaaYVPB6MKoEvykvDUy1QcEF4+R1t2s8fSuvXQZ8ea5cWaIgACScIxxZmrqNzj
 aF+yGo1LbjtDr0xJui65h0hClW6untdNFtKRYuRuYcViYvcxiOk5qh3SCawiHA+gza5f8PuGd
 KyPR2mrrN7py911iYUZ+AUrmxth2o9hgMs85FHa9WkuFSHtA4oR0JYwXnQc8buX10EfYvxV
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Thu, Jul 30, 2020 at 10:38 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Jul 30, 2020 at 10:15:24AM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 30, 2020 at 10:07 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > On Tue, Jul 28, 2020 at 3:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Tue, Jul 28, 2020 at 3:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > Something like
> > > >
> > > > static int lineevent_put_data(void __user *uptr, struct gpioevent_data *ge)
> > > > {
> > > > #ifdef __x86_64__
> > > >         /* i386 has no padding after 'id' */
> > > >         if (in_ia32_syscall()) {
> > > >                 struct {
> > > >                         compat_u64      timestamp __packed;
> > > >                         u32             id;
> > > >                 } compat_ge = { ge->timestamp, ge->id };
> > > >
> > > >                 if (copy_to_user(uptr, &compat_ge, sizeof(compat_ge)))
> > > >                         return -EFAULT;
> > > >
> > > >                 return sizeof(compat_ge);
> > > >         }
> > > > #endif
> > > >
> > > >         if (copy_to_user(uptr, ge, sizeof(*ge))
> > > >                 return -EFAULT;
> > > >
> > > >         return sizeof(*ge);
> > > > }
> > > >
> > > >        Arnd
> > >
> > > Hi Arnd,
> > >
> > > Andy actually had a patch for that but since this isn't a regression
> > > (it never worked), we decided to leave it as it is and get it right in
> > > v2 API.
> >
> > I would argue that it needs to be fixed anyway, unless you also want
> > to remove the v1 interface for native mode. If this works on 32-bit
> > kernels, on 64-bit kernels with 64-bit user space and on compat
> > 32-bit user space on 64-bit non-x86 architectures, I see no reason
> > to leave it broken specifically on x86 compat user space. There are
> > still reasons to use 32-bit x86 user space for low-memory machines
> > even though native i386 kernels are getting increasingly silly.
>
> It was possible to "fix" (mitigate to some extent) before libgpiod got support
> for several events in a request. Now it seems to be impossible to fix. AFAIU we
> must discard any request to more than one event in it.

Any reason why the workaround I suggested above would not work?
The in_ia32_syscall() check should be completely reliable in telling whether
we are called from read() by an ia32 task or not, and we use the same
logic for input_event, which has a similar problem (on all compat architectures,
not just x86).

> However I'm not an expert in compat IOCTL code (you are :-) and perhaps you may
> provide ideas better than mine.

What makes this interface tricky is that this is actually a read() call, not
ioctl() which is usually easier because it encodes the data length in the
command code. As far as I could tell from skimming the interface, the
ioctls are actually fine here.

    Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
