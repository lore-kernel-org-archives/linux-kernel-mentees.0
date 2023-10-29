Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C46EC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 18:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00AB070816;
	Sun, 29 Oct 2023 18:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00AB070816
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gtSkl3gq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fD149e_xiZGj; Sun, 29 Oct 2023 18:41:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DBC8760E48;
	Sun, 29 Oct 2023 18:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC8760E48
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE7AFC0071;
	Sun, 29 Oct 2023 18:41:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02647C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCE1C4ECF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCE1C4ECF1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=gtSkl3gq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkiYDoQ0e7_B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:41:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABC9D4ECEB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC9D4ECEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698604916; x=1730140916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4FFufjLNr4846R4FP5r0jinRPlFp0S9jNHqTPJGf77o=;
 b=gtSkl3gqu4iyWozM5pHZBQyqzd/+LY/sFScwlMHmQD88asMDdF2QEbTM
 lOP6VugDlrXsZMH/aSOT1+6t2ZxgL+28c3et2UiW9WIQTQSCUurU1+eBY
 b0uv5WxmeKeKuzGBif+D1MsGsMY/7aLxfa7ryUKzYzgtCvpBo64PTY2TX
 rsxjxMMpB5cv5nheIYBzwPP1+LTkiJG6pdTn2RC31KBXuCkTlklK4GfuD
 UJ3QilDesuixD7dk4rPY2P1Q+WU9YYKKZ+H+n2rZGHIYyzut0hOUpEO/s
 fYSHvjMaP+gWwOc834Q5kLTbXxTLqHtBCIOu6oYag5s7w2tdSIikwoFA/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="387789246"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; d="scan'208";a="387789246"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 11:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="760079543"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; d="scan'208";a="760079543"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 29 Oct 2023 11:41:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qxAjN-000Ckl-0U;
 Sun, 29 Oct 2023 18:41:49 +0000
Date: Mon, 30 Oct 2023 02:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>,
 seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] KVM: x86: cleanup unused variables
Message-ID: <202310300228.s4py0SQf-lkp@intel.com>
References: <20231029093859.138442-1-jose.pekkarinen@foxhound.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231029093859.138442-1-jose.pekkarinen@foxhound.fi>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, hpa@zytor.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Jos=E9,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on linus/master v6.6-rc7 next-20231027]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Pekkarinen/KVM-x=
86-cleanup-unused-variables/20231029-174855
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20231029093859.138442-1-jose.pekka=
rinen%40foxhound.fi
patch subject: [PATCH] KVM: x86: cleanup unused variables
config: i386-buildonly-randconfig-006-20231030 (https://download.01.org/0da=
y-ci/archive/20231030/202310300228.s4py0SQf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231030/202310300228.s4py0SQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300228.s4py0SQf-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/emulate.c: In function 'decode_modrm':
>> arch/x86/kvm/emulate.c:950:9: error: 'rc' undeclared (first use in this =
function); did you mean 'rq'?
     950 |         rc =3D do_insn_fetch_bytes(_ctxt, sizeof(_type));       =
          \
         |         ^~
   arch/x86/kvm/emulate.c:1225:45: note: in expansion of macro 'insn_fetch'
    1225 |                                 modrm_ea +=3D insn_fetch(u16, ct=
xt);
         |                                             ^~~~~~~~~~
   arch/x86/kvm/emulate.c:950:9: note: each undeclared identifier is report=
ed only once for each function it appears in
     950 |         rc =3D do_insn_fetch_bytes(_ctxt, sizeof(_type));       =
          \
         |         ^~
   arch/x86/kvm/emulate.c:1225:45: note: in expansion of macro 'insn_fetch'
    1225 |                                 modrm_ea +=3D insn_fetch(u16, ct=
xt);
         |                                             ^~~~~~~~~~
   arch/x86/kvm/emulate.c: In function 'decode_abs':
>> arch/x86/kvm/emulate.c:950:9: error: 'rc' undeclared (first use in this =
function); did you mean 'rq'?
     950 |         rc =3D do_insn_fetch_bytes(_ctxt, sizeof(_type));       =
          \
         |         ^~
   arch/x86/kvm/emulate.c:1317:35: note: in expansion of macro 'insn_fetch'
    1317 |                 op->addr.mem.ea =3D insn_fetch(u16, ctxt);
         |                                   ^~~~~~~~~~
   arch/x86/kvm/emulate.c: In function 'decode_imm':
>> arch/x86/kvm/emulate.c:950:9: error: 'rc' undeclared (first use in this =
function); did you mean 'rq'?
     950 |         rc =3D do_insn_fetch_bytes(_ctxt, sizeof(_type));       =
          \
         |         ^~
   arch/x86/kvm/emulate.c:4560:27: note: in expansion of macro 'insn_fetch'
    4560 |                 op->val =3D insn_fetch(s8, ctxt);
         |                           ^~~~~~~~~~


vim +950 arch/x86/kvm/emulate.c

6226686954c4cc drivers/kvm/x86_emulate.c Avi Kivity       2007-11-20  945  =

67cbc90db5c0f0 arch/x86/kvm/emulate.c    Takuya Yoshikawa 2011-05-15  946  =
/* Fetch next part of the instruction being emulated. */
e85a10852c26d7 arch/x86/kvm/emulate.c    Takuya Yoshikawa 2011-07-30  947  =
#define insn_fetch(_type, _ctxt)					\
9506d57de3bc82 arch/x86/kvm/emulate.c    Paolo Bonzini    2014-05-06  948  =
({	_type _x;							\
9506d57de3bc82 arch/x86/kvm/emulate.c    Paolo Bonzini    2014-05-06  949  =
									\
9506d57de3bc82 arch/x86/kvm/emulate.c    Paolo Bonzini    2014-05-06 @950  =
	rc =3D do_insn_fetch_bytes(_ctxt, sizeof(_type));			\
67cbc90db5c0f0 arch/x86/kvm/emulate.c    Takuya Yoshikawa 2011-05-15  951  =
	if (rc !=3D X86EMUL_CONTINUE)					\
67cbc90db5c0f0 arch/x86/kvm/emulate.c    Takuya Yoshikawa 2011-05-15  952  =
		goto done;						\
9506d57de3bc82 arch/x86/kvm/emulate.c    Paolo Bonzini    2014-05-06  953  =
	ctxt->_eip +=3D sizeof(_type);					\
8616abc2537933 arch/x86/kvm/emulate.c    Nick Desaulniers 2017-06-27  954  =
	memcpy(&_x, ctxt->fetch.ptr, sizeof(_type));			\
17052f16a51af6 arch/x86/kvm/emulate.c    Paolo Bonzini    2014-05-06  955  =
	ctxt->fetch.ptr +=3D sizeof(_type);				\
9506d57de3bc82 arch/x86/kvm/emulate.c    Paolo Bonzini    2014-05-06  956  =
	_x;								\
67cbc90db5c0f0 arch/x86/kvm/emulate.c    Takuya Yoshikawa 2011-05-15  957  =
})
67cbc90db5c0f0 arch/x86/kvm/emulate.c    Takuya Yoshikawa 2011-05-15  958  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
