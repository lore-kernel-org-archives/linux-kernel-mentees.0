Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E26C25B67
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 15:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C311426A2;
	Thu, 26 Oct 2023 15:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C311426A2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCyM8lay
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsMq1nVoukK0; Thu, 26 Oct 2023 15:17:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 71CBB42414;
	Thu, 26 Oct 2023 15:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71CBB42414
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AAA2C0071;
	Thu, 26 Oct 2023 15:17:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29E7BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12001424EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12001424EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNL9oUw3njIp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:17:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AE1842414
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE1842414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698333446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fgM36SpZwrGqrgTUTrL8+qbWVWryBY61X1wo6VnsJ+g=;
 b=PCyM8lay64ptLHqeglpcSUBtpkSRPEHJmyVo+XTMhrPgfBOSE+zYP1Xdh7VTxPzLyh5R19
 kVGw/Ohm51Es5a3EhVZ4tEQ5EBmG94dIYdZb+Bc3LwIkKn27X1rON3eiCdqhmlxaQoDcXy
 vfbF+FPbsjbCNLNMrAhrN5I3obEyMNM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-brAT18dwMum2lg02fKXJug-1; Thu, 26 Oct 2023 11:17:23 -0400
X-MC-Unique: brAT18dwMum2lg02fKXJug-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-53e3bfec5bdso768741a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 08:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333442; x=1698938242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgM36SpZwrGqrgTUTrL8+qbWVWryBY61X1wo6VnsJ+g=;
 b=jSLXnJwH/iwv80dIXwrk1AlfZOsFnTl8pRnj6iNVR/tf3aYUdjZ9ZF2GJ7vOSBhCnw
 enFia80rSXrI5WzSZxVANMkG2B3Dsqha/Rzn1mp8m+vQJscXXNgRZYeMN6+Fa+M1cLHq
 t2erGsjfiYYm89peqLc+/pduQqCkzbMLIu+cz/4BTKOc9r6dtR+8Kyo5lsssw5/cOzKw
 ROKGwTY11qEKv4443TYDAg+5xb9ogGF9F4fpJCC79wfbLGZEdXmtkF3dUHnxuiJ6Vkkc
 Rz9OrZ40HH2xGs7lSPov8NQj/tABognbSEI5aaDIqrwEMmAOCWMxArDOh96/zcNzVHhj
 0CQQ==
X-Gm-Message-State: AOJu0YwDhWaHsNnEShcjCnDsMxnkchN+xmpZ1vOhs9YNBKbNww76Xivw
 t0s3DLjjibW0ktnr5RC5X7pgze5vh/B5r/7WVm5oQauz8O6AcCCHi2d1o4nr8m4v0UvpJS9CoJF
 4nrDzmmJGl9Zm5TuFcxkBup8OsG49jgFMNNNN15l+3VxaFGiw
X-Received: by 2002:a05:6402:a54:b0:53d:d799:641 with SMTP id
 bt20-20020a0564020a5400b0053dd7990641mr42936edb.26.1698333442301; 
 Thu, 26 Oct 2023 08:17:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqCfzj7EKvJtyLSrooN8GJkqXWkwTAxwCVKw/7OBanp3iLeG6msWIgxR6CSOpTrj2/moQaKg==
X-Received: by 2002:a05:6402:a54:b0:53d:d799:641 with SMTP id
 bt20-20020a0564020a5400b0053dd7990641mr42908edb.26.1698333441671; 
 Thu, 26 Oct 2023 08:17:21 -0700 (PDT)
Received: from redhat.com ([2a02:14f:17b:37eb:8e1f:4b3b:22c7:7722])
 by smtp.gmail.com with ESMTPSA id
 w12-20020aa7cb4c000000b0053e7809615esm11362265edt.80.2023.10.26.08.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:17:21 -0700 (PDT)
Date: Thu, 26 Oct 2023 11:17:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH v2] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231026110925-mutt-send-email-mst@kernel.org>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
 <20231026091222-mutt-send-email-mst@kernel.org>
 <CAGudoHFXH_FDgKRaJvVgQ3W8wD2TC=8yhiNm1NECApnQ-CNAZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGudoHFXH_FDgKRaJvVgQ3W8wD2TC=8yhiNm1NECApnQ-CNAZQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: brauner@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 peterz@infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Abhinav Singh <singhabhinav9051571833@gmail.com>,
 mathieu.desnoyers@efficios.com, shakeelb@google.com, akpm@linux-foundation.org,
 surenb@google.com, michael.christie@oracle.com
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

On Thu, Oct 26, 2023 at 04:06:24PM +0200, Mateusz Guzik wrote:
> On 10/26/23, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Thu, Oct 26, 2023 at 05:46:21PM +0530, Abhinav Singh wrote:
> >> This patch fixes the warning about directly dereferencing a pointer
> >> tagged with __rcu annotation.
> >>
> >> Dereferencing the pointers tagged with __rcu directly should
> >> always be avoided according to the docs. There is a rcu helper
> >> functions rcu_dereference(...) to use when dereferencing a __rcu
> >> pointer. This functions returns the non __rcu tagged pointer which
> >> can be dereferenced just like a normal pointers.
> >>
> >> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> >
> > Well yes but these need to be called under rcu_read_lock.
> > Who does it here?
> > If no one then maybe you found an actual bug and we need to
> > fix it not paper over it.
> >
> 
> There is no bug here.
> 
> p is the newly created thread, ->real_cred was initialized just prior
> to this code and there is nobody to whack the creds from under it.
> 
> Second bit in the patch changes one real_parent deref, but leaves 2
> others just above it. Once more no bug since the entire thing happens
> under tasklist_lock, but the patch should either sort all these cases
> or none.
> 
> I think it would help if the submitter had shown warnings they see.

Yes, and this must be tested under lockdep, which I think would
spit out warnings for this patch.

What should be used here I'm not sure. IIUC rcu_dereference_protected(p, 1)
is discouraged now?

-- 
MST

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
