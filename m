Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F56C6FD19
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Mar 2023 09:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C80817A7;
	Mon, 13 Mar 2023 09:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1C80817A7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dG/46LCu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJaSCu9RSLGt; Mon, 13 Mar 2023 09:25:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 834B281776;
	Mon, 13 Mar 2023 09:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834B281776
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A1FBC0071;
	Mon, 13 Mar 2023 09:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C0F4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 09:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1734C817A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 09:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1734C817A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FPwrR9BwIYb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 09:25:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDFDC81776
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDFDC81776
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 09:25:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so7343857wmq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Mar 2023 02:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678699522;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oemU04S4EIP3+LlbdYWaEi24KjHjlI+DFXxErUigKSs=;
 b=dG/46LCuvRBvtVi36X1zuQFs1B1+6cl4Nn4twthBIRfmVSGE51QUZ+Lr26zlcxlrHI
 nX5aqfJ9MKdJ9HG0zlFsGpfjvYSwT9eCZDK5RBtf6coGRlgY7JBRDc/joHsaQU/6eueh
 VePFZQXWzOFuZHAhv1eCOzkp79DyfIvjmwcQk86molONkUp2QIOgTg+YOMzEcYzlQrcM
 1ru0hBZnCuTiM/s30OaaxSp/4waWQ2XEVKX9WvXj7uirt9ndFAHA8oIuAIuEXNOg0TFE
 znVJyxLSj3a8fEkkNY3tcIxyV+vN7PBGfMxbB9nQveK5slcXUci16YcCKQ4MZiwRqhKs
 cnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678699522;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oemU04S4EIP3+LlbdYWaEi24KjHjlI+DFXxErUigKSs=;
 b=MpfMa6f+edRnecHsbQdgMakBcF0U6HFNd/K6SXUwvxMUAADQM3SZ0uZgS2pzRroKQU
 voqw6c3mTOLXq+2ZpUoIA+TNJt/Ic/moPod11lXXZ4eYWhVEEBR+DLwqf5vaT/GFJVum
 W+/ecssmHF9vVeNatEC4Vt9f//Kc8XtzJEmO1RhcOueCwzpXYMvJ+TRpeX9q8uJGj8Eb
 BwD9yyAB0MqUir7nef+P4kVErAP1flIkQfXGNtp/qUzSGs7cMHsZCMBrXhIwCOcIrMK1
 B3pqhdwyAnAuixw5JEybzM/mKMVpad0QAfp3OWzxFhI/417OY7FB44SCWL6QTT3CB30b
 3HSA==
X-Gm-Message-State: AO0yUKWzLVhy+K4AUU+DP486cOgjpBTmzbidzk8F4sXw0HfBN3JpFF4p
 8DEXTN8PCdcty/ow65yIrcw=
X-Google-Smtp-Source: AK7set/j5QmRFkSepULMGjz536Oure7syuY0MABWMX+Gi9mSeJR9sE37XxrnMeeIrriz3umn1wuWdA==
X-Received: by 2002:a05:600c:a4c:b0:3dc:d5c:76d9 with SMTP id
 c12-20020a05600c0a4c00b003dc0d5c76d9mr10913475wmq.0.1678699521970; 
 Mon, 13 Mar 2023 02:25:21 -0700 (PDT)
Received: from localhost ([2001:b07:5d37:537d:cd23:cd6e:ae14:44fe])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003db01178b62sm9181086wmq.40.2023.03.13.02.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 02:25:21 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 13 Mar 2023 10:25:19 +0100
Message-Id: <CR55BD4YCDR1.22R5TLYJW6YS0@vincent-arch>
Subject: Re: [RFC PATCH v1 1/1] linux: mm_types: allow to modified the
 vm_flags in vm_area_struct
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230312224250.425727-1-vincenzopalazzodev@gmail.com>
 <20230312175703.d8d8e0192387dfa9592ee8e5@linux-foundation.org>
In-Reply-To: <20230312175703.d8d8e0192387dfa9592ee8e5@linux-foundation.org>
Cc: david@redhat.com, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, Suren Baghdasaryan <surenb@google.com>, jgg@ziepe.ca,
 Liam.Howlett@oracle.com, linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon Mar 13, 2023 at 1:57 AM CET, Andrew Morton wrote:
> On Sun, 12 Mar 2023 23:42:50 +0100 Vincenzo Palazzo <vincenzopalazzodev@gmail.com> wrote:
>
> > With 6.3-rc1 is not possible to build the following drivers
>
> Well, let's cc Suren who actually wrote bc292ab00f6c ("mm: introduce
> vma->vm_flags wrapper functions").
>
> > - nvidia, that the compilation returns the following errors
> > 
> > - vboxhost/7.0.6_OSE where the build fails with the following errors
> > 
> > ...
> >
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -497,7 +497,7 @@ struct vm_area_struct {
> >  	 * To modify use vm_flags_{init|reset|set|clear|mod} functions.
> >  	 */
> >  	union {
> > -		const vm_flags_t vm_flags;
> > +		vm_flags_t vm_flags;
> >  		vm_flags_t __private __vm_flags;
> >  	};
>
> These out-of-tree drivers should be converted to use the wrappers which
> bc292ab00f6c added.  Their maintainers have a couple of months to do
> this before bc292ab00f6c is released in 6.3.

Yeah I thought about that! nvidia update as soon as the 6.3 is out, not sure
about vboxhost. But let the driver update to this new feature make sense.

>
> It's unfortunate.  I guess it would be better if we were to find a way
> to permit these drivers to compile OK but to generate warnings, as an
> interim thing for six months or so.  Perhaps there's some clever way.

Yeah it is! Regarding giving the possiblity to compile ok (and
preserving the previous behavior) look like an interesting thought for 
kernel API, but am I think that it this is difficult to do?

The real things that I'm missing with the new wrapper API
is the meaning of the new `vm_flags_t vm_flags`, before the 
field was only one and it was getting modified, but now the real
value is the private one `__vm_flags`, so what is the meaning of 
the new `vm_flags`?

I feel that this question is stupid but I can not avoid do it, otherwise 
my mind think about it till I will not find an answer :)

P.S: regaring the warning at compile time the __deprecated looks a good
fit to generate error message, but to me in this particular case do not.

Thanks,

Vincent.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
