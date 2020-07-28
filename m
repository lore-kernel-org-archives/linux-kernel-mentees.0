Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8852C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 13:58:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C337A2074F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 13:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C337A2074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 97FFC8458F;
	Tue, 28 Jul 2020 13:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6STR1p6wVvfL; Tue, 28 Jul 2020 13:58:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E118B8459B;
	Tue, 28 Jul 2020 13:58:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5A8BC004F;
	Tue, 28 Jul 2020 13:58:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63DA5C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 13:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C47E226EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 13:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HiJaHP6pEI-3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 13:58:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by silver.osuosl.org (Postfix) with ESMTPS id 6453B226D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 13:58:42 +0000 (UTC)
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5xDJ-1k7qmS0Sdv-007TtC for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Jul 2020 15:58:39
 +0200
Received: by mail-qt1-f173.google.com with SMTP id x12so6341924qtp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 06:58:38 -0700 (PDT)
X-Gm-Message-State: AOAM5328uVP5J2AOOba859/mBxKSDrPAJNro7WxeGvz7WQkIQzjjKJE0
 FV04Zb9cti2m2qEu/NouXYwyDVYqOlzZTGrZFJc=
X-Google-Smtp-Source: ABdhPJwcnjVzdXtH0ZMmkoqshSACaXjuaYnltOnaP33Va8Er6+9hKFR05vX7mZbNRjlSOGS84rqh1JYn+h/D4FTuw+M=
X-Received: by 2002:ac8:5195:: with SMTP id c21mr12200851qtn.304.1595944717799; 
 Tue, 28 Jul 2020 06:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
In-Reply-To: <20200728130632.GI1913@kadam>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2020 15:58:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
Message-ID: <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Provags-ID: V03:K1:qtlvZXRfkw4S8NRHNJToKsX8GhdThBwdg07Rd+Ic4lEvPBfnNKU
 vnWKi+mcdS/3S58PhY27lh+k6i0kMVt12xdeL8gUxrWWw3ryFAPcsdkAhnIT9jGgPiDFQYQ
 jQfFf4pMWAnDrCHmfDfKusFFk0pavb+4/ldKSjLqli+yVog0Qdphb4Iz5MEPl2PgZK/nBpx
 m6G+kZ7Nf5oIBg4QgWz6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yxGCDAJF+TU=:x0tcAVUMkCNB0rW9C1jHIM
 O/t7cA4HM0IZqWngkD/no+JM+5tS2zKSkfz/885RhB7h6c4u3Gq1jnQYqZ+JPXhO8XJ1CBsTZ
 ydpO6c8zBrCAHpYnxnL2yBmUMpV2Vev3PjhS27yhlNFKe3iiPWU+CaSpxYNBvMiExnYvO0lJb
 HYT8bbCwcHKBdsHN29TilqjZPRaq7LXeH1rRMy9+f0ZIWk3u68uf3g5ropHkRRnf+y+NXKNlt
 sM7+zRznZczlWBYg5/8d9HMqoc8NxvSHaOFdm4KRTNnppMsUjJWxSRZ0JQeIB9Uw4P0/MqZF1
 njLZ/90M++wDwnw6PrIE9BRCvy7eIZKo77hrNtzPPlwxnc7ExYNxHki4IBnvupWdxR3ByL12q
 NnbdopMUqnsj8ATLNS7WNR4mlSqPtZ7vnHWD0yTS7+TRGXN/CI+LADxfJbayC0O4Pc0ZU8NVH
 xXVNn+GXmg712fbO4zpIUWI/213nTjWqOcfjPzNTZOoroXiPfKz/QXN/aOP1VKLJY6ONN2nkb
 w1uavdkbUh+6L3/lbzL4MhigYd78NagqcxJYrpra3JnTln2VRW0IDvzo9BosAvQh/Awi+O4sK
 +tqYnqU0rZgFCHcHkr4ShMB+nkkXKUm86x4SLgmZWb2Gs12wopYzlh86Y6XwT65HkXQdAyIUe
 9VolWHJV+C4FQLs0FPSNlUz1EpHAMZ/QnjAqUXnxwywpftjfTy+ezguUNFnsCJmzH1zvphuo9
 rCuoX8FUU0J1JAxzAg2hkZkitIMJdyltPNIj1CqwnBCWekgb47tF3zHxd5TXM6ib+ZY6yJOQ0
 kB2u98Z3Cn+7YMLSwv08XPUnnkjeLB07aN+gonhvJZJtMgPnGqwxaHVX2n/fMiUvrdSFeflCg
 mG42XuB9SQrN+97dF8OHjclMlQbZo78jMre3KPvYahqLfPK+8TjfOaBG63fMFVCYU4Fy0rkkM
 w3EqHJTJts3YR1w+u1aFWUOd/+r4FNmjM+zw4rg6DBSY1to1JtA42
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Linus Walleij <linus.walleij@linaro.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Peilin Ye <yepeilin.cs@gmail.com>,
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

On Tue, Jul 28, 2020 at 3:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jul 28, 2020 at 02:22:29PM +0200, Linus Walleij wrote:
> > On Mon, Jul 27, 2020 at 3:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > > Here are my latest warnings on linux-next from Friday.
> >
> > Thanks for sharing this Dan, very interesting findings.
> >
> > > drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')
> >
> > We are revamping the ABI for 64bit compatibility so we are now running
> > pahole on our stuff. I suppose we need to think about mending this old ABI
> > as well.
>
> Yeah...  But this one is a false positive.  It's not super hard for me
> to silence it actually.  I'll take care of it.  It could be a while
> before I push this to the public repository though...

The lineevent_read() function still needs to be fixed to support
32-bit compat mode on x86, which is independent of the warning.

Something like

static int lineevent_put_data(void __user *uptr, struct gpioevent_data *ge)
{
#ifdef __x86_64__
        /* i386 has no padding after 'id' */
        if (in_ia32_syscall()) {
                struct {
                        compat_u64      timestamp __packed;
                        u32             id;
                } compat_ge = { ge->timestamp, ge->id };

                if (copy_to_user(uptr, &compat_ge, sizeof(compat_ge)))
                        return -EFAULT;

                return sizeof(compat_ge);
        }
#endif

        if (copy_to_user(uptr, ge, sizeof(*ge))
                return -EFAULT;

        return sizeof(*ge);
}

       Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
