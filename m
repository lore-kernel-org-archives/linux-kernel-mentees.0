Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5B3C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 08:07:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD9320656
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 08:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD9320656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A34CE20109;
	Sun,  9 Feb 2020 08:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y62A+z+bzfyO; Sun,  9 Feb 2020 08:07:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BAFC920035;
	Sun,  9 Feb 2020 08:07:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFDA6C07FE;
	Sun,  9 Feb 2020 08:07:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48D18C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 08:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3CD1F85C9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 08:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1Ut2QPqd38Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 08:07:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6C4E985C90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 08:07:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,420,1574118000"; d="scan'208";a="338564791"
Received: from abo-105-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.105])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2020 09:07:28 +0100
Date: Sun, 9 Feb 2020 09:07:27 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <c97f4e5641f8c68e35ae6f0e00940762c84dc2ac.camel@gmail.com>
Message-ID: <alpine.DEB.2.21.2002090906090.3430@hadrien>
References: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
 <20200207060938.9531-1-jaskaransingh7654321@gmail.com>
 <20200207060938.9531-3-jaskaransingh7654321@gmail.com>
 <alpine.DEB.2.21.2002090817580.3430@hadrien>
 <c97f4e5641f8c68e35ae6f0e00940762c84dc2ac.camel@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] tests: Add test case to
 match const pointer variants
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

On Sun, 9 Feb 2020, Jaskaran Singh wrote:

> On Sun, 2020-02-09 at 08:20 +0100, Julia Lawall wrote:
> > On Fri, 7 Feb 2020, Jaskaran Singh wrote:
> >
> > > Pointer to const pointer and its variants would not match
> > > previously.
> > > Add a test case for matching these types.
> >
> > I don't get any matches for this test.  If I split the semantic patch
> > into
> > four separate rules, then I get the change for id2 and id4, but not
> > for
> > the other two.
> >
>
> That's weird, it works fine for me. I get this on both bytecode and
> native builds.

OK, you're right, it's OK.

Can you fix the *const problem?  I still see that one.

thanks,
julia

>
> --- tests/constptr.c
> +++ /tmp/cocci-output-31326-084eed-constptr.c
> @@ -1,7 +1,7 @@
>  int main()
>  {
> -	const char * const * id;
> -	const char * * const * id;
> -	const char * const * * id;
> -	const char * const id;
> +	const char * const * id1;
> +	const char * * const * id2;
> +	const char * const * * id3;
> +	const char * const id4;
>  }
>
>
> On the other hand, I get the id2 and id4 result with upstream.
>
> --- tests/constptr.c
> +++ /tmp/cocci-output-5387-a9b63b-constptr.c
> @@ -1,7 +1,7 @@
>  int main()
>  {
>  	const char * const * id;
> -	const char * * const * id;
> +	const char * * const * id2;
>  	const char * const * * id;
> -	const char * const id;
> +	const char * const id4;
>  }
>
> Could you check if you've applied 1/2 first?
>
> Cheers,
> Jaskaran.
>
> > julia
> >
> > > Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> > > ---
> > >  tests/constptr.c     |  7 +++++++
> > >  tests/constptr.cocci | 19 +++++++++++++++++++
> > >  tests/constptr.res   |  7 +++++++
> > >  3 files changed, 33 insertions(+)
> > >  create mode 100644 tests/constptr.c
> > >  create mode 100644 tests/constptr.cocci
> > >  create mode 100644 tests/constptr.res
> > >
> > > diff --git a/tests/constptr.c b/tests/constptr.c
> > > new file mode 100644
> > > index 00000000..13fe064c
> > > --- /dev/null
> > > +++ b/tests/constptr.c
> > > @@ -0,0 +1,7 @@
> > > +int main()
> > > +{
> > > +	const char * const * id;
> > > +	const char * * const * id;
> > > +	const char * const * * id;
> > > +	const char * const id;
> > > +}
> > > diff --git a/tests/constptr.cocci b/tests/constptr.cocci
> > > new file mode 100644
> > > index 00000000..29f0aa96
> > > --- /dev/null
> > > +++ b/tests/constptr.cocci
> > > @@ -0,0 +1,19 @@
> > > +@ r0 @
> > > +identifier id;
> > > +@@
> > > +const char * const *
> > > +- id
> > > ++ id1
> > > +;
> > > +const char * * const *
> > > +- id
> > > ++ id2
> > > +;
> > > +const char * const * *
> > > +- id
> > > ++ id3
> > > +;
> > > +const char * const
> > > +- id
> > > ++ id4
> > > +;
> > > diff --git a/tests/constptr.res b/tests/constptr.res
> > > new file mode 100644
> > > index 00000000..0af4de9a
> > > --- /dev/null
> > > +++ b/tests/constptr.res
> > > @@ -0,0 +1,7 @@
> > > +int main()
> > > +{
> > > +	const char * const * id1;
> > > +	const char * * const * id2;
> > > +	const char * const * * id3;
> > > +	const char * const id4;
> > > +}
> > > --
> > > 2.21.1
> > >
> > >
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
