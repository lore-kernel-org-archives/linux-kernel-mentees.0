Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783DFC3DA6F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Aug 2023 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C2F8214C;
	Wed, 23 Aug 2023 19:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C2F8214C
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Pz5GxaNu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wk6PGdKF9vDj; Wed, 23 Aug 2023 19:35:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CF22182147;
	Wed, 23 Aug 2023 19:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF22182147
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAC0CC0039;
	Wed, 23 Aug 2023 19:35:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5A21C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FA0E400FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 19:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA0E400FF
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Pz5GxaNu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnw9FMGGnU_L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 19:35:53 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67F30400C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 19:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67F30400C8
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31771bb4869so5342118f8f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Aug 2023 12:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692819351; x=1693424151;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bp6bqfxHSQpdkJRolDmXvKb/3Pn3dAeE7ceDWHWRWDA=;
 b=Pz5GxaNuZRWinCrudpRM+C6sPFDBxK+ivZHBISs3ftAuYHWoN/CiGfoZc3wneRFyzr
 YOE35feW/4E6p/qBo5AoobnPCdphf3sLAR3NhBjOVkSc/7lGfk4AvZo+l3ZGeqELWAua
 dXi2R9F+coHLxhqBXa8ijVNVaNr1REcetkiGtSue7Djan5z7k2M1N0NjITTzPEtZmBLv
 a1OUCSn4uGpnx16Pe+edGOSJWNbUSTF4swUW9sMK2jV6ecXzu9om6ZR+uaoL/C5OIFg4
 CQD7XievlNqaf42X8hksPc6AzRdhOQHaSXG8iByc0qI6mVQnri+yg0KPkdO3u37L+VIG
 L/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692819351; x=1693424151;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bp6bqfxHSQpdkJRolDmXvKb/3Pn3dAeE7ceDWHWRWDA=;
 b=eqnbAwqCKtQH/ZjEI35iP8y+ld+pnwBTVsQxsSJ/2CRB+s1Kj58yLMkFioa8Uc438c
 9DWm14cvimDYWKtMfiFMmUALREl6MCf1PCTImbrEupkOKe8JjSAhipusLcIDcK7OHB9l
 it8FoWHRLG7aYArSLPR3vfpIZqtMaRXCKccDT1fNZ7cBZIkUlSEOpVh55eiso+JkZVt4
 oIepqZYUIEWT9YVc8yXbkZkqwOiZ3oDDCEkOxyMFVkmhFpgKxOUGU3/i9PAAR+vn1Hit
 wEUeEP8moVIvSanx50vatYUL4Brmr3XwPhuGwC/VDd2cbpbn3DcpKi1XZoT0Br0dTWyn
 m8gg==
X-Gm-Message-State: AOJu0YzvLYgWv5p3Y6C4harlrmxLMHG3Y/8uO6A4Z9hc6rxeCncXHnPU
 BG037WPyYa5tG8ZEAKD2sNM=
X-Google-Smtp-Source: AGHT+IE/pM8ndpJGoLUlBS3tuaqhUZ8RbNcGhFz69gcMjVcaQK1oUzA23JffSfe6yWFdi+iqNFaCAg==
X-Received: by 2002:adf:f3cd:0:b0:319:6ce2:e5a3 with SMTP id
 g13-20020adff3cd000000b003196ce2e5a3mr10674485wrp.26.1692819351220; 
 Wed, 23 Aug 2023 12:35:51 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx
 ([2001:8f8:1163:806e:99f3:c946:a43c:e1e3])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d68c6000000b00317f70240afsm20336320wrw.27.2023.08.23.12.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 12:35:50 -0700 (PDT)
Date: Wed, 23 Aug 2023 23:35:45 +0400
From: Mahmoud Matook <mahmoudmatook.mm@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 1/2] selftests: Provide local define of min() and max()
Message-ID: <20230823193545.nrzlbsa32hm4os4k@mmaatuq-HP-Laptop-15-dy2xxx>
Mail-Followup-To: David Laight <David.Laight@ACULAB.COM>,
 'Willem de Bruijn' <willemdebruijn.kernel@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
 <20230819195005.99387-2-mahmoudmatook.mm@gmail.com>
 <64e22df53d1e6_3580162945b@willemb.c.googlers.com.notmuch>
 <7e8c2597c71647f38cd4672cbef53a66@AcuMS.aculab.com>
 <CAF=yD-+6cWTiDgpsu=hUV+OvzDFRaT2ZUmtQo9qTrCB9i-+7ng@mail.gmail.com>
 <d33fbb24119c4d09864e79ea9dfbb881@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d33fbb24119c4d09864e79ea9dfbb881@AcuMS.aculab.com>
Cc: 'Willem de Bruijn' <willemdebruijn.kernel@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

On 08/22, David Laight wrote:

> ...
> > > That typecheck() is horrid.
> > > It may well have caused more bugs due to incorrect casts that
> > > it actually detected.
> > >
> > > I'd suggest the version that just avoids multiple evaluations.
> > > Or just error signed v unsigned comparisons.
> > > See  https://lore.kernel.org/all/b4ce9dad748e489f9314a2dc95615033@AcuMS.aculab.com/
> > > for an example patch set.
> > 
> > Interesting, thanks. That is also simpler.
> > 
> > Also, the existing patch is no worse than the open coded code today,
> > so even without code to avoid multiple evaluations, I guess it's okay
> > to merge.
> > 
> > The coccinelle warnings are arguably false positives, using checks for
> > kernel code, but being run against userspace code that has no access
> > to those helpers. But fine to silence them.
> 
> You can't use is_constexpr() unless 'sizeof *(void *)' is valid.
> And builtin_constant() isn't good enough for builtin_choose_expr().
> 
> That might be ok for selftests and tools, but not for generaluserspace.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
I tried to use the relaxed version provided in the shared patchset link 
besides not able to use is_constexpr(), I'm not able to use
__UNIQUE_ID() also. It's definded inside include/linux/compiler-gcc.h
and it uses another macro __PASTE() which is defined inside
include/linux/compiler_types.h. 
not sure what to do next
- bring those macros definitions to able to use the relaxed version.
- if the most important point for min/max defines inside selftests is to
  avoid multiple evaluation is the below version acceptable?
  /*
  #define min(x, y) ({ \
    typeof(x) _x = (x); \
    typeof(y) _y = (y); \
    _x < _y ? _x : _y; \
})

#define max(x, y) ({ \
    typeof(x) _x = (x); \
    typeof(y) _y = (y); \
    _x > _y ? _x : _y; \
})
*/
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
