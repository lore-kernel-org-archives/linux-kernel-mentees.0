Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2527BC25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 15:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF4B42D09;
	Thu, 26 Oct 2023 15:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF4B42D09
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DlDuIC86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eU_ikH9w__1S; Thu, 26 Oct 2023 15:47:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9447442D06;
	Thu, 26 Oct 2023 15:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9447442D06
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71C2EC0071;
	Thu, 26 Oct 2023 15:47:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF602C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB08683E56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB08683E56
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DlDuIC86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LOcWj6bRu4z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:47:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B93083CAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B93083CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698335249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fk2PSPwJDmK9xnue8X0u8askj/ho1m46L6G3QWm1uws=;
 b=DlDuIC86QgYi0tKvV8viWte9iTILKCx5p3bdaFqio0GcB2wYvl2utJWbfXyOs6mB08ySfq
 V0qlMboWrJts07Bm8V0/rkO4mMVSK/Z9QSAdzgPop11tfci2NNJQRkoqXFNCUl826pWF00
 eBRUTyg9XZzRci/aqIGbgxaBJ4WXWNs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-IEpUiDHDPkG2QDowGDJg5w-1; Thu, 26 Oct 2023 11:47:26 -0400
X-MC-Unique: IEpUiDHDPkG2QDowGDJg5w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9b2cf504e3aso75293766b.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 08:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698335245; x=1698940045;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fk2PSPwJDmK9xnue8X0u8askj/ho1m46L6G3QWm1uws=;
 b=W6hKYVvhe6YehLlmmx9r4iKGcyDM+Hs0/I7pKAYgPXSAtNO0cSP20f/rzz0PoBN5nw
 Y3p6O1770eJC7WheOfzUX8YK4FrxzNslFKUxIOZl5eTShm/6FOf1KqrmQ0jjxz6umpWH
 SBJ9kZknjGz8yvkuN6GWC8i/01geYFUGU8JWQOh41izJ6ZRMciXcCWX+evZrvtuidZOw
 bfP5licS7mMMaTY6XOtJiDgiC5wRvMm5aDpDqljGBEN5W3TeYJApwKoRMOZu/Qk/SHXI
 iNKb5spKBZssvsp8T0o311HJtVQ1dmML6TjAEKWlKAQWpyyUapfG/i0UUdFB0YRUghmS
 tVqw==
X-Gm-Message-State: AOJu0Yya6yl0o4W2ito8s5a6QN2I6Lp+iBO5UsU0ndx5qj8mNwvgl0wl
 0YP3KP+PzgaiklfOvNn2pbIZZvoxTLPds2BE3A55O7FDTJC7Pd2llkhogP+6lL68FpZsNTJuWqP
 OoLVg1tMf0PxtTdVAwc8SBjxiJ8qSamFliwAkJKvyPsW+sIXB
X-Received: by 2002:a17:907:804:b0:9ba:65e:750e with SMTP id
 wv4-20020a170907080400b009ba065e750emr69514ejb.32.1698335245344; 
 Thu, 26 Oct 2023 08:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIzu0aS0oc/2eHVO/DT6wawL1gzMdNRmV1kFde8qwDfqO5GBCHprOwhqQcajFXJJ0yJKHm2g==
X-Received: by 2002:a17:907:804:b0:9ba:65e:750e with SMTP id
 wv4-20020a170907080400b009ba065e750emr69495ejb.32.1698335245019; 
 Thu, 26 Oct 2023 08:47:25 -0700 (PDT)
Received: from redhat.com ([2a02:14f:17b:37eb:8e1f:4b3b:22c7:7722])
 by smtp.gmail.com with ESMTPSA id
 dn22-20020a05640222f600b005401a4184ddsm8499249edb.27.2023.10.26.08.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:47:24 -0700 (PDT)
Date: Thu, 26 Oct 2023 11:47:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH v2] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231026114632-mutt-send-email-mst@kernel.org>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
 <20231026091222-mutt-send-email-mst@kernel.org>
 <CAGudoHFXH_FDgKRaJvVgQ3W8wD2TC=8yhiNm1NECApnQ-CNAZQ@mail.gmail.com>
 <20231026110925-mutt-send-email-mst@kernel.org>
 <dc028fd0-b188-435e-9dc3-f5de53dd9686@gmail.com>
MIME-Version: 1.0
In-Reply-To: <dc028fd0-b188-435e-9dc3-f5de53dd9686@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: brauner@kernel.org, Mateusz Guzik <mjguzik@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, peterz@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, mathieu.desnoyers@efficios.com, shakeelb@google.com,
 akpm@linux-foundation.org, surenb@google.com, michael.christie@oracle.com
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

On Thu, Oct 26, 2023 at 09:07:46PM +0530, Abhinav Singh wrote:
> On 10/26/23 20:47, Michael S. Tsirkin wrote:
> > On Thu, Oct 26, 2023 at 04:06:24PM +0200, Mateusz Guzik wrote:
> > > On 10/26/23, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Thu, Oct 26, 2023 at 05:46:21PM +0530, Abhinav Singh wrote:
> > > > > This patch fixes the warning about directly dereferencing a pointer
> > > > > tagged with __rcu annotation.
> > > > > 
> > > > > Dereferencing the pointers tagged with __rcu directly should
> > > > > always be avoided according to the docs. There is a rcu helper
> > > > > functions rcu_dereference(...) to use when dereferencing a __rcu
> > > > > pointer. This functions returns the non __rcu tagged pointer which
> > > > > can be dereferenced just like a normal pointers.
> > > > > 
> > > > > Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> > > > 
> > > > Well yes but these need to be called under rcu_read_lock.
> > > > Who does it here?
> > > > If no one then maybe you found an actual bug and we need to
> > > > fix it not paper over it.
> > > > 
> > > 
> > > There is no bug here.
> > > 
> > > p is the newly created thread, ->real_cred was initialized just prior
> > > to this code and there is nobody to whack the creds from under it.
> > > 
> > > Second bit in the patch changes one real_parent deref, but leaves 2
> > > others just above it. Once more no bug since the entire thing happens
> > > under tasklist_lock, but the patch should either sort all these cases
> > > or none.
> Sparse reported 3 similar dereferencing warning this patch contains 2 fixes
> for 2, but yeah I should fixed all 3 of them.
> > > 
> > > I think it would help if the submitter had shown warnings they see.
> The warning message :- warning: dereference of noderef expression
> > 
> > Yes, and this must be tested under lockdep, which I think would
> > spit out warnings for this patch.
> Not sure, but I tested this with sparse (make C=2) and after the above
> changes I dont get the warning.

sparse is a static analysis tool. You should also actually
test your patch.

> > 
> > What should be used here I'm not sure. IIUC rcu_dereference_protected(p, 1)
> > is discouraged now?
> > 
> Not sure but I read that, rcu_dereference should be prefered when reading
> and rcu_dereference_protected should when writing.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
